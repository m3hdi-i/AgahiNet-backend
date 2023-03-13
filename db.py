import asyncio
from typing import Any

import asyncpg
from asyncpg import PostgresError

pg_pool: Any

user_tbl='chat."User"'
message_tbl='chat."Message"'

async def get_pg_pool():
    return await asyncpg.create_pool(user='postgres', password='bob123456', database='postgres', host='127.0.0.1')


async def add_message(messge_body, creator_id, recipient_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            res = await conn.execute(
                f"INSERT INTO {message_tbl}(message_body,creator_id,recipient_id) VALUES('{messge_body}',{creator_id},{recipient_id})")
            affected_rows_count = int(res.split()[2]) if res.split()[0] == 'INSERT' else 0
            return affected_rows_count

    except PostgresError as e :
        print(e)
        return None


async def get_messages_of_room(u1, u2, limit,offset):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"SELECT * FROM {message_tbl} WHERE ((creator_id={u1} AND recipient_id={u2}) OR (creator_id={u2} AND recipient_id={u1})) ORDER BY created_at DESC LIMIT {limit} OFFSET {offset}"
            records = await conn.fetch(query)
            j = []
            for r in records:
                m={}
                for c in r.keys():
                    m[c]=r[c]
                j.append(m)

            return j

    except PostgresError as e:
        print(e)
        return None

async def get_user_name(uid):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:

            query = f"SELECT name FROM {user_tbl} WHERE uid={uid}"
            records = await conn.fetch(query)
            return records[0]['name']
    except PostgresError as e:
        print(e)
        return None

async def get_chatlist_of_user(uid):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:

            query=f"select * from {message_tbl} as msg WHERE ((creator_id={uid} AND recipient_id!={uid}) OR (creator_id!={uid} AND recipient_id={uid}) ) AND NOT EXISTS (SELECT creator_id,recipient_id,created_at FROM {message_tbl} WHERE ( ((recipient_id=msg.recipient_id AND creator_id=msg.creator_id) OR (recipient_id=msg.creator_id AND creator_id=msg.recipient_id)) AND created_at > msg.created_at) )"
            records = await conn.fetch(query)
            j = []
            for r in records:
                m = {}
                for c in r.keys():
                    m[c] = r[c]
                j.append(m)

            # Add contact name col.
            for m in j:
                if m['creator_id'] != uid:
                    m['contact_name']=await get_user_name(m['creator_id'])
                else:
                    m['contact_name'] = await get_user_name(m['recipient_id'])

            return j

    except PostgresError as e:
        print(e)
        return None

# async def test():
#     global pg_pool
#     pg_pool = await get_pg_pool()
#
#     res = await get_messages_of_room(12,13)
#     print(res)
#
#     await pg_pool.close()
#
#
# asyncio.new_event_loop().run_until_complete(test())