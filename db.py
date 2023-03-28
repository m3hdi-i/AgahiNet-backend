import asyncio
import hashlib
from typing import Any
import asyncpg
from asyncpg import PostgresError


pg_pool: Any

user_tbl = 'iagahi."User"'
message_tbl = 'iagahi."Message"'
image_tbl='iagahi."Image"'
city_tbl='iagahi."City"'
category_tbl='iagahi."Category"'
bookmark_tbl='iagahi."Bookmark"'
ad_tbl='iagahi."Ad"'

async def get_pg_pool():
    return await asyncpg.create_pool(user='postgres', password='bob123456', database='postgres', host='127.0.0.1')


# --------------- Chat app funcs ---------------

async def add_message(messge_body, creator_id, recipient_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            res = await conn.execute(f"INSERT INTO {message_tbl}(message_body,creator_id,recipient_id) VALUES('{messge_body}',{creator_id},{recipient_id})")

        affected_rows_count = int(res.split()[2]) if res.split()[0] == 'INSERT' else 0
        return affected_rows_count

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def get_messages_of_room(u1, u2, limit, offset):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"SELECT * FROM {message_tbl} WHERE ((creator_id={u1} AND recipient_id={u2}) OR (creator_id={u2} AND recipient_id={u1})) ORDER BY created_at DESC LIMIT {limit} OFFSET {offset}"
            records = await conn.fetch(query)

        return [dict(i) for i in records]

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def get_user_fullname(uid):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"SELECT fullname FROM {user_tbl} WHERE uid={uid}"
            record = await conn.fetchrow(query)

        return record['fullname']

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def get_chatlist_of_user(uid):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"select * from {message_tbl} as msg WHERE ((creator_id={uid} AND recipient_id!={uid}) OR (creator_id!={uid} AND recipient_id={uid}) ) AND NOT EXISTS (SELECT creator_id,recipient_id,created_at FROM {message_tbl} WHERE ( ((recipient_id=msg.recipient_id AND creator_id=msg.creator_id) OR (recipient_id=msg.creator_id AND creator_id=msg.recipient_id)) AND created_at > msg.created_at) )"
            records = await conn.fetch(query)

        j=[dict(i) for i in records]

        # Add contact name col.
        for m in j:
            if m['creator_id'] != uid:
                m['contact_name'] = await get_user_fullname(m['creator_id'])
            else:
                m['contact_name'] = await get_user_fullname(m['recipient_id'])

        return j

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

# --------------- Classified ads app funcs ---------------

async def authenticate_user(email: str, password: str):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            hashed_password = hashlib.sha256(password.encode('utf-8')).hexdigest()
            query = f"SELECT uid,fullname FROM {user_tbl} WHERE email='{email}' and password='{hashed_password}'"
            res = await conn.fetchrow(query)
        if res:
            return dict(res)
        else:
            return None


    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def signup_user(fullname, email, password):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            hashed_password = hashlib.sha256(password.encode('utf-8')).hexdigest()
            query = f"INSERT INTO {user_tbl}(fullname,password,email) VALUES('{fullname}','{hashed_password}','{email}') RETURNING uid,fullname"
            res = await conn.fetchrow(query)

        if res:
            return dict(res)
        else:
            return None

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def add_image(url):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            res = await conn.fetchrow(
                f"INSERT INTO {image_tbl}(url) VALUES('{url}') RETURNING image_id")
        return res['image_id']

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def get_url_of_image(image_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"SELECT * FROM {image_tbl} WHERE image_id={image_id}"
            record = await conn.fetchrow(query)
        return record['url']
    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def get_cities():
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"SELECT * FROM {city_tbl}"
            records = await conn.fetch(query)
        return [dict(i) for i in records]
    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def get_categories():
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"SELECT * FROM {category_tbl}"
            records = await conn.fetch(query)
        return [dict(i) for i in records]
    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def create_ad(title,description,price,category,creator,city,images_list,main_image_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            async with conn.transaction():
                if not main_image_id:
                    main_image_id='NULL'
                if not price:
                    price='NULL'
                res = await conn.fetchrow(f"INSERT INTO {ad_tbl}(title,description,price,category,creator,city,main_image_id) VALUES('{title}','{description}',{price},{category},{creator},{city},{main_image_id}) RETURNING ad_id")
                ad_id=res['ad_id']

                if images_list:
                    await conn.execute(f"UPDATE {image_tbl} SET ad_id={ad_id} WHERE image_id IN ({','.join([str(i) for i in images_list])})")

        return ad_id

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None


async def get_ad(ad_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"SELECT * FROM {ad_tbl} WHERE ad_id={ad_id}"
            record = await conn.fetchrow(query)

        result=dict(record)
        if record['price']:
            result['price'] ='{:f}'.format(record['price'].normalize())
        return result

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def get_ads(keyword,categoty,cities,min_price, max_price, limit, offset):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            filters=[]
            if keyword:
                keyword_q=f"(title LIKE '%{keyword}%' or description LIKE '%{keyword}%')"
                filters.append(keyword_q)
            if categoty:
                categoty_q = f"(category={categoty})"
                filters.append(categoty_q)
            if cities:
                cities_q = f"(city IN ({','.join([str(x) for x in cities])}))"
                filters.append(cities_q)
            if min_price:
                min_price_q=f"(price >= {min_price})"
                filters.append(min_price_q)
            if max_price:
                max_price_q=f"(price <= {max_price})"
                filters.append(max_price_q)

            where_clause=' WHERE '+' AND '.join(filters) if len(filters)>0 else ''
            query = f"SELECT * FROM {ad_tbl}{where_clause} ORDER BY created_at DESC LIMIT {limit} OFFSET {offset}"
            print(query)
            records = await conn.fetch(query)

        result=[]
        for r in records:
            item=dict(r)
            if r['price']:
                item['price'] = '{:f}'.format(r['price'].normalize())
            result.append(item)

        return result

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None


async def edit_ad(ad_id,title,description,price,category,creator,city,images_list_old,images_list_new,main_image_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            async with conn.transaction():
                images_list_old = images_list_old if images_list_old else []
                images_list_new =images_list_new if images_list_new else []

                if set(images_list_old) != set(images_list_new):
                    delete_list=[str(i) for i in list(set(images_list_old)-set(images_list_new))]
                    if delete_list:
                        q2=f"DELETE FROM {image_tbl} WHERE image_id IN ({','.join(delete_list)})"
                        await conn.execute(q2)

                    add_list =[str(i) for i in list(set(images_list_new)-set(images_list_old))]
                    if add_list:
                        q=f"UPDATE {image_tbl} SET ad_id={ad_id} WHERE image_id IN ({','.join(add_list)})"
                        await conn.execute(q)

                if not main_image_id:
                    main_image_id = 'NULL'
                if not price:
                    price = 'NULL'

                query= f"UPDATE {ad_tbl} SET title='{title}', description='{description}', price={price}, category={category}, creator={creator}, city={city},main_image_id={main_image_id} WHERE ad_id={ad_id}"
                res = await conn.execute(query)

        return res=='UPDATE 1'

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def remove_ad(ad_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            res = await conn.execute(f"DELETE FROM {ad_tbl} WHERE ad_id={ad_id}")
        return res=='DELETE 1'

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None

async def create_bookmark(uid,ad_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            res = await conn.execute(
                f"INSERT INTO {bookmark_tbl}(uid,ad_id) VALUES('{uid}',{ad_id})")
            affected_rows_count = int(res.split()[2]) if res.split()[0] == 'INSERT' else 0
        return affected_rows_count==1

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None


async def get_bookmarks_of_user(uid):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            query = f"SELECT * FROM ( SELECT ad_id, created_at AS b_created_at FROM {bookmark_tbl} WHERE uid = {uid} ) AS bkm INNER JOIN {ad_tbl} USING ( ad_id ) ORDER BY b_created_at DESC"
            records = await conn.fetch(query)
        return [dict(i) for i in records]
    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None


async def remove_bookmark(uid,ad_id):
    global pg_pool
    try:
        async with pg_pool.acquire() as conn:
            res = await conn.execute( f"DELETE FROM {bookmark_tbl} WHERE uid={uid} AND ad_id={ad_id}")
        return res == 'DELETE 1'

    except (PostgresError, KeyError, IndexError) as e:
        print(e)
        return None



# async def test():
#     global pg_pool
#     pg_pool = await get_pg_pool()
#
#     print(await get_chatlist_of_user(12))
#
#     await pg_pool.close()
#
#
#
# asyncio.new_event_loop().run_until_complete(test())
