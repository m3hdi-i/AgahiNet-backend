import json
from typing import Any

import asyncpg
from asyncpg import PostgresError

pg_pool: Any


async def get_pg_pool():
    return await asyncpg.create_pool(user='postgres', password='bob123456', database='postgres', host='127.0.0.1')


async def add_message(messge_body, creator_id, recipient_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            res = await conn.execute(
                f"INSERT INTO chat.message(message_body,creator_id,recipient_id) VALUES('{messge_body}',{creator_id},{recipient_id})")
            affected_rows_count = int(res.split()[2]) if res.split()[0] == 'INSERT' else 0
            return affected_rows_count

    except PostgresError :
        return None


async def get_messages_of_room_as_json(u1, u2, limit: int = 0):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"SELECT * FROM chat.message WHERE ((creator_id={u1} AND recipient_id={u2}) OR (creator_id={u2} AND recipient_id={u1})) ORDER BY created_at"
            if limit > 0:
                query += f" LIMIT {limit}"

            records = await conn.fetch(query)
            j = []
            for r in records:
                m = {
                    'mid': r['mid'],
                    'message_body': r['message_body'],
                    'creator_id': r['creator_id'],
                    'recipient_id': r['recipient_id'],
                    'created_at': r['created_at'],
                    'is_read': r['is_read'],
                }
                j.append(m)

            result = json.dumps(j, indent=4, default=str)

            return result

    except PostgresError:
        return None


# async def test():
#     u1=12
#     u2=13
#     limit=10
#
#     conn = await asyncpg.connect(user='postgres', password='bob123456', database='postgres', host='127.0.0.1')
#
#     query = f"SELECT * FROM chat.message WHERE ((creator_id={u1} AND recipient_id={u2}) OR (creator_id={u2} AND recipient_id={u1})) ORDER BY created_at"
#
#
# asyncio.new_event_loop().run_until_complete(test())