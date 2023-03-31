/*
 Navicat PostgreSQL Data Transfer

 Source Server         : mypg
 Source Server Type    : PostgreSQL
 Source Server Version : 150002 (150002)
 Source Host           : localhost:5432
 Source Catalog        : postgres
 Source Schema         : iagahi

 Target Server Type    : PostgreSQL
 Target Server Version : 150002 (150002)
 File Encoding         : 65001

 Date: 31/03/2023 15:45:54
*/


-- ----------------------------
-- Sequence structure for Ad_ad_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "iagahi"."Ad_ad_id_seq";
CREATE SEQUENCE "iagahi"."Ad_ad_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Category_cat_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "iagahi"."Category_cat_id_seq";
CREATE SEQUENCE "iagahi"."Category_cat_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for City_city_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "iagahi"."City_city_id_seq";
CREATE SEQUENCE "iagahi"."City_city_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Image_image_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "iagahi"."Image_image_id_seq";
CREATE SEQUENCE "iagahi"."Image_image_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for message_mid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "iagahi"."message_mid_seq";
CREATE SEQUENCE "iagahi"."message_mid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_uid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "iagahi"."user_uid_seq";
CREATE SEQUENCE "iagahi"."user_uid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Ad
-- ----------------------------
DROP TABLE IF EXISTS "iagahi"."Ad";
CREATE TABLE "iagahi"."Ad" (
  "ad_id" int8 NOT NULL DEFAULT nextval('"iagahi"."Ad_ad_id_seq"'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "price" numeric(100,0),
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "category" int4 NOT NULL,
  "creator" int8 NOT NULL,
  "city" int4 NOT NULL,
  "main_image_id" int8
)
;


-- ----------------------------
-- Table structure for Bookmark
-- ----------------------------
DROP TABLE IF EXISTS "iagahi"."Bookmark";
CREATE TABLE "iagahi"."Bookmark" (
  "uid" int8 NOT NULL,
  "ad_id" int8 NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;


-- ----------------------------
-- Table structure for Category
-- ----------------------------
DROP TABLE IF EXISTS "iagahi"."Category";
CREATE TABLE "iagahi"."Category" (
  "cat_id" int4 NOT NULL DEFAULT nextval('"iagahi"."Category_cat_id_seq"'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int4
)
;

-- ----------------------------
-- Records of Category
-- ----------------------------
INSERT INTO "iagahi"."Category" VALUES (1, 'املاک', NULL);
INSERT INTO "iagahi"."Category" VALUES (2, 'وسایل نقلیه', NULL);
INSERT INTO "iagahi"."Category" VALUES (3, 'کالای دیجیتال', NULL);
INSERT INTO "iagahi"."Category" VALUES (4, 'خانه و آشپزخانه', NULL);
INSERT INTO "iagahi"."Category" VALUES (5, 'خدمات', NULL);
INSERT INTO "iagahi"."Category" VALUES (6, 'وسایل شخصی', NULL);
INSERT INTO "iagahi"."Category" VALUES (7, 'سرگرمی و فراغت', NULL);
INSERT INTO "iagahi"."Category" VALUES (8, 'تجهیزات و صنعتی', NULL);
INSERT INTO "iagahi"."Category" VALUES (9, 'استخدام و کاریابی', NULL);
INSERT INTO "iagahi"."Category" VALUES (10, 'اجتماعی', NULL);
INSERT INTO "iagahi"."Category" VALUES (11, 'سایر دسته‌ها', NULL);

-- ----------------------------
-- Table structure for City
-- ----------------------------
DROP TABLE IF EXISTS "iagahi"."City";
CREATE TABLE "iagahi"."City" (
  "city_id" int4 NOT NULL DEFAULT nextval('"iagahi"."City_city_id_seq"'::regclass),
  "sub" int4,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of City
-- ----------------------------
INSERT INTO "iagahi"."City" VALUES (1, NULL, 'آذربایجان شرقی');
INSERT INTO "iagahi"."City" VALUES (2, NULL, 'آذربایجان غربی');
INSERT INTO "iagahi"."City" VALUES (3, NULL, 'اردبیل');
INSERT INTO "iagahi"."City" VALUES (4, NULL, 'اصفهان');
INSERT INTO "iagahi"."City" VALUES (5, NULL, 'البرز');
INSERT INTO "iagahi"."City" VALUES (6, NULL, 'ایلام');
INSERT INTO "iagahi"."City" VALUES (7, NULL, 'بوشهر');
INSERT INTO "iagahi"."City" VALUES (8, NULL, 'تهران');
INSERT INTO "iagahi"."City" VALUES (9, NULL, 'چهارمحال وبختیاری');
INSERT INTO "iagahi"."City" VALUES (10, NULL, 'خراسان جنوبی');
INSERT INTO "iagahi"."City" VALUES (11, NULL, 'خراسان رضوی');
INSERT INTO "iagahi"."City" VALUES (12, NULL, 'خراسان شمالی');
INSERT INTO "iagahi"."City" VALUES (13, NULL, 'خوزستان');
INSERT INTO "iagahi"."City" VALUES (14, NULL, 'زنجان');
INSERT INTO "iagahi"."City" VALUES (15, NULL, 'سمنان');
INSERT INTO "iagahi"."City" VALUES (16, NULL, 'سیستان وبلوچستان');
INSERT INTO "iagahi"."City" VALUES (17, NULL, 'فارس');
INSERT INTO "iagahi"."City" VALUES (18, NULL, 'قزوین');
INSERT INTO "iagahi"."City" VALUES (19, NULL, 'قم');
INSERT INTO "iagahi"."City" VALUES (20, NULL, 'کردستان');
INSERT INTO "iagahi"."City" VALUES (21, NULL, 'کرمان');
INSERT INTO "iagahi"."City" VALUES (22, NULL, 'کرمانشاه');
INSERT INTO "iagahi"."City" VALUES (23, NULL, 'کهگیلویه وبویراحمد');
INSERT INTO "iagahi"."City" VALUES (24, NULL, 'گلستان');
INSERT INTO "iagahi"."City" VALUES (25, NULL, 'گیلان');
INSERT INTO "iagahi"."City" VALUES (26, NULL, 'لرستان');
INSERT INTO "iagahi"."City" VALUES (27, NULL, 'مازندران');
INSERT INTO "iagahi"."City" VALUES (28, NULL, 'مرکزی');
INSERT INTO "iagahi"."City" VALUES (29, NULL, 'هرمزگان');
INSERT INTO "iagahi"."City" VALUES (30, NULL, 'همدان');
INSERT INTO "iagahi"."City" VALUES (31, NULL, 'یزد');
INSERT INTO "iagahi"."City" VALUES (32, 1, 'آذرشهر');
INSERT INTO "iagahi"."City" VALUES (33, 1, 'تیمورلو');
INSERT INTO "iagahi"."City" VALUES (34, 1, 'گوگان');
INSERT INTO "iagahi"."City" VALUES (35, 1, 'ممقان');
INSERT INTO "iagahi"."City" VALUES (36, 1, 'اسکو');
INSERT INTO "iagahi"."City" VALUES (37, 1, 'ایلخچی');
INSERT INTO "iagahi"."City" VALUES (38, 1, 'سهند');
INSERT INTO "iagahi"."City" VALUES (39, 1, 'اهر');
INSERT INTO "iagahi"."City" VALUES (40, 1, 'هوراند');
INSERT INTO "iagahi"."City" VALUES (41, 1, 'بستان آباد');
INSERT INTO "iagahi"."City" VALUES (42, 1, 'تیکمه داش');
INSERT INTO "iagahi"."City" VALUES (43, 1, 'بناب');
INSERT INTO "iagahi"."City" VALUES (44, 1, 'باسمنج');
INSERT INTO "iagahi"."City" VALUES (45, 1, 'تبریز');
INSERT INTO "iagahi"."City" VALUES (46, 1, 'خسروشاه');
INSERT INTO "iagahi"."City" VALUES (47, 1, 'سردرود');
INSERT INTO "iagahi"."City" VALUES (48, 1, 'جلفا');
INSERT INTO "iagahi"."City" VALUES (49, 1, 'سیه رود');
INSERT INTO "iagahi"."City" VALUES (50, 1, 'هادیشهر');
INSERT INTO "iagahi"."City" VALUES (51, 1, 'قره آغاج');
INSERT INTO "iagahi"."City" VALUES (52, 1, 'خمارلو');
INSERT INTO "iagahi"."City" VALUES (53, 1, 'دوزدوزان');
INSERT INTO "iagahi"."City" VALUES (54, 1, 'سراب');
INSERT INTO "iagahi"."City" VALUES (55, 1, 'شربیان');
INSERT INTO "iagahi"."City" VALUES (56, 1, 'مهربان');
INSERT INTO "iagahi"."City" VALUES (57, 1, 'تسوج');
INSERT INTO "iagahi"."City" VALUES (58, 1, 'خامنه');
INSERT INTO "iagahi"."City" VALUES (59, 1, 'سیس');
INSERT INTO "iagahi"."City" VALUES (60, 1, 'شبستر');
INSERT INTO "iagahi"."City" VALUES (61, 1, 'شرفخانه');
INSERT INTO "iagahi"."City" VALUES (62, 1, 'شندآباد');
INSERT INTO "iagahi"."City" VALUES (63, 1, 'صوفیان');
INSERT INTO "iagahi"."City" VALUES (64, 1, 'کوزه کنان');
INSERT INTO "iagahi"."City" VALUES (65, 1, 'وایقان');
INSERT INTO "iagahi"."City" VALUES (66, 1, 'جوان قلعه');
INSERT INTO "iagahi"."City" VALUES (67, 1, 'عجب شیر');
INSERT INTO "iagahi"."City" VALUES (68, 1, 'آبش احمد');
INSERT INTO "iagahi"."City" VALUES (69, 1, 'کلیبر');
INSERT INTO "iagahi"."City" VALUES (70, 1, 'خداجو(خراجو)');
INSERT INTO "iagahi"."City" VALUES (71, 1, 'مراغه');
INSERT INTO "iagahi"."City" VALUES (72, 1, 'بناب مرند');
INSERT INTO "iagahi"."City" VALUES (73, 1, 'زنوز');
INSERT INTO "iagahi"."City" VALUES (74, 1, 'کشکسرای');
INSERT INTO "iagahi"."City" VALUES (75, 1, 'مرند');
INSERT INTO "iagahi"."City" VALUES (76, 1, 'یامچی');
INSERT INTO "iagahi"."City" VALUES (77, 1, 'لیلان');
INSERT INTO "iagahi"."City" VALUES (78, 1, 'مبارک شهر');
INSERT INTO "iagahi"."City" VALUES (79, 1, 'ملکان');
INSERT INTO "iagahi"."City" VALUES (80, 1, 'آقکند');
INSERT INTO "iagahi"."City" VALUES (81, 1, 'اچاچی');
INSERT INTO "iagahi"."City" VALUES (82, 1, 'ترک');
INSERT INTO "iagahi"."City" VALUES (83, 1, 'ترکمانچای');
INSERT INTO "iagahi"."City" VALUES (84, 1, 'میانه');
INSERT INTO "iagahi"."City" VALUES (85, 1, 'خاروانا');
INSERT INTO "iagahi"."City" VALUES (86, 1, 'ورزقان');
INSERT INTO "iagahi"."City" VALUES (87, 1, 'بخشایش');
INSERT INTO "iagahi"."City" VALUES (88, 1, 'خواجه');
INSERT INTO "iagahi"."City" VALUES (89, 1, 'زرنق');
INSERT INTO "iagahi"."City" VALUES (90, 1, 'کلوانق');
INSERT INTO "iagahi"."City" VALUES (91, 1, 'هریس');
INSERT INTO "iagahi"."City" VALUES (92, 1, 'نظرکهریزی');
INSERT INTO "iagahi"."City" VALUES (93, 1, 'هشترود');
INSERT INTO "iagahi"."City" VALUES (94, 2, 'ارومیه');
INSERT INTO "iagahi"."City" VALUES (95, 2, 'سرو');
INSERT INTO "iagahi"."City" VALUES (96, 2, 'سیلوانه');
INSERT INTO "iagahi"."City" VALUES (97, 2, 'قوشچی');
INSERT INTO "iagahi"."City" VALUES (98, 2, 'نوشین');
INSERT INTO "iagahi"."City" VALUES (99, 2, 'اشنویه');
INSERT INTO "iagahi"."City" VALUES (100, 2, 'نالوس');
INSERT INTO "iagahi"."City" VALUES (101, 2, 'بوکان');
INSERT INTO "iagahi"."City" VALUES (102, 2, 'سیمینه');
INSERT INTO "iagahi"."City" VALUES (103, 2, 'پلدشت');
INSERT INTO "iagahi"."City" VALUES (104, 2, 'نازک علیا');
INSERT INTO "iagahi"."City" VALUES (105, 2, 'پیرانشهر');
INSERT INTO "iagahi"."City" VALUES (106, 2, 'گردکشانه');
INSERT INTO "iagahi"."City" VALUES (107, 2, 'تکاب');
INSERT INTO "iagahi"."City" VALUES (108, 2, 'آواجیق');
INSERT INTO "iagahi"."City" VALUES (109, 2, 'سیه چشمه');
INSERT INTO "iagahi"."City" VALUES (110, 2, 'قره ضیاءالدین');
INSERT INTO "iagahi"."City" VALUES (111, 2, 'ایواوغلی');
INSERT INTO "iagahi"."City" VALUES (112, 2, 'خوی');
INSERT INTO "iagahi"."City" VALUES (113, 2, 'دیزج دیز');
INSERT INTO "iagahi"."City" VALUES (114, 2, 'زرآباد');
INSERT INTO "iagahi"."City" VALUES (115, 2, 'فیرورق');
INSERT INTO "iagahi"."City" VALUES (116, 2, 'قطور');
INSERT INTO "iagahi"."City" VALUES (117, 2, 'ربط');
INSERT INTO "iagahi"."City" VALUES (118, 2, 'سردشت');
INSERT INTO "iagahi"."City" VALUES (119, 2, 'میرآباد');
INSERT INTO "iagahi"."City" VALUES (120, 2, 'تازه شهر');
INSERT INTO "iagahi"."City" VALUES (121, 2, 'سلماس');
INSERT INTO "iagahi"."City" VALUES (122, 2, 'شاهین دژ');
INSERT INTO "iagahi"."City" VALUES (123, 2, 'کشاورز');
INSERT INTO "iagahi"."City" VALUES (124, 2, 'محمودآباد');
INSERT INTO "iagahi"."City" VALUES (125, 2, 'شوط');
INSERT INTO "iagahi"."City" VALUES (126, 2, 'مرگنلر');
INSERT INTO "iagahi"."City" VALUES (127, 2, 'بازرگان');
INSERT INTO "iagahi"."City" VALUES (128, 2, 'ماکو');
INSERT INTO "iagahi"."City" VALUES (129, 2, 'خلیفان');
INSERT INTO "iagahi"."City" VALUES (130, 2, 'مهاباد');
INSERT INTO "iagahi"."City" VALUES (131, 2, 'باروق');
INSERT INTO "iagahi"."City" VALUES (132, 2, 'چهاربرج');
INSERT INTO "iagahi"."City" VALUES (133, 2, 'میاندوآب');
INSERT INTO "iagahi"."City" VALUES (134, 2, 'محمدیار');
INSERT INTO "iagahi"."City" VALUES (135, 2, 'نقده');
INSERT INTO "iagahi"."City" VALUES (136, 3, 'اردبیل');
INSERT INTO "iagahi"."City" VALUES (137, 3, 'هیر');
INSERT INTO "iagahi"."City" VALUES (138, 3, 'بیله سوار');
INSERT INTO "iagahi"."City" VALUES (139, 3, 'جعفرآباد');
INSERT INTO "iagahi"."City" VALUES (140, 3, 'اسلام اباد');
INSERT INTO "iagahi"."City" VALUES (141, 3, 'اصلاندوز');
INSERT INTO "iagahi"."City" VALUES (142, 3, 'پارس آباد');
INSERT INTO "iagahi"."City" VALUES (143, 3, 'تازه کند');
INSERT INTO "iagahi"."City" VALUES (144, 3, 'خلخال');
INSERT INTO "iagahi"."City" VALUES (145, 3, 'کلور');
INSERT INTO "iagahi"."City" VALUES (146, 3, 'هشتجین');
INSERT INTO "iagahi"."City" VALUES (147, 3, 'سرعین');
INSERT INTO "iagahi"."City" VALUES (148, 3, 'گیوی');
INSERT INTO "iagahi"."City" VALUES (149, 3, 'تازه کندانگوت');
INSERT INTO "iagahi"."City" VALUES (150, 3, 'گرمی');
INSERT INTO "iagahi"."City" VALUES (151, 3, 'رضی');
INSERT INTO "iagahi"."City" VALUES (152, 3, 'فخراباد');
INSERT INTO "iagahi"."City" VALUES (153, 3, 'قصابه');
INSERT INTO "iagahi"."City" VALUES (154, 3, 'لاهرود');
INSERT INTO "iagahi"."City" VALUES (155, 3, 'مرادلو');
INSERT INTO "iagahi"."City" VALUES (156, 3, 'مشگین شهر');
INSERT INTO "iagahi"."City" VALUES (157, 3, 'آبی بیگلو');
INSERT INTO "iagahi"."City" VALUES (158, 3, 'عنبران');
INSERT INTO "iagahi"."City" VALUES (159, 3, 'نمین');
INSERT INTO "iagahi"."City" VALUES (160, 3, 'کوراییم');
INSERT INTO "iagahi"."City" VALUES (161, 3, 'نیر');
INSERT INTO "iagahi"."City" VALUES (162, 4, 'آران وبیدگل');
INSERT INTO "iagahi"."City" VALUES (163, 4, 'ابوزیدآباد');
INSERT INTO "iagahi"."City" VALUES (164, 4, 'سفیدشهر');
INSERT INTO "iagahi"."City" VALUES (165, 4, 'نوش آباد');
INSERT INTO "iagahi"."City" VALUES (166, 4, 'اردستان');
INSERT INTO "iagahi"."City" VALUES (167, 4, 'زواره');
INSERT INTO "iagahi"."City" VALUES (168, 4, 'مهاباد');
INSERT INTO "iagahi"."City" VALUES (169, 4, 'اژیه');
INSERT INTO "iagahi"."City" VALUES (170, 4, 'اصفهان');
INSERT INTO "iagahi"."City" VALUES (171, 4, 'بهارستان');
INSERT INTO "iagahi"."City" VALUES (172, 4, 'تودشک');
INSERT INTO "iagahi"."City" VALUES (173, 4, 'حسن اباد');
INSERT INTO "iagahi"."City" VALUES (174, 4, 'زیار');
INSERT INTO "iagahi"."City" VALUES (175, 4, 'سجزی');
INSERT INTO "iagahi"."City" VALUES (176, 4, 'قهجاورستان');
INSERT INTO "iagahi"."City" VALUES (177, 4, 'کوهپایه');
INSERT INTO "iagahi"."City" VALUES (178, 4, 'محمدآباد');
INSERT INTO "iagahi"."City" VALUES (179, 4, 'نصرآباد');
INSERT INTO "iagahi"."City" VALUES (180, 4, 'نیک آباد');
INSERT INTO "iagahi"."City" VALUES (181, 4, 'ورزنه');
INSERT INTO "iagahi"."City" VALUES (182, 4, 'هرند');
INSERT INTO "iagahi"."City" VALUES (183, 4, 'حبیب آباد');
INSERT INTO "iagahi"."City" VALUES (184, 4, 'خورزوق');
INSERT INTO "iagahi"."City" VALUES (185, 4, 'دستگرد');
INSERT INTO "iagahi"."City" VALUES (186, 4, 'دولت آباد');
INSERT INTO "iagahi"."City" VALUES (187, 4, 'سین');
INSERT INTO "iagahi"."City" VALUES (188, 4, 'شاپورآباد');
INSERT INTO "iagahi"."City" VALUES (189, 4, 'کمشچه');
INSERT INTO "iagahi"."City" VALUES (190, 4, 'افوس');
INSERT INTO "iagahi"."City" VALUES (191, 4, 'بویین ومیاندشت');
INSERT INTO "iagahi"."City" VALUES (192, 4, 'تیران');
INSERT INTO "iagahi"."City" VALUES (193, 4, 'رضوانشهر');
INSERT INTO "iagahi"."City" VALUES (194, 4, 'عسگران');
INSERT INTO "iagahi"."City" VALUES (195, 4, 'چادگان');
INSERT INTO "iagahi"."City" VALUES (196, 4, 'رزوه');
INSERT INTO "iagahi"."City" VALUES (197, 4, 'اصغرآباد');
INSERT INTO "iagahi"."City" VALUES (198, 4, 'خمینی شهر');
INSERT INTO "iagahi"."City" VALUES (199, 4, 'درچه');
INSERT INTO "iagahi"."City" VALUES (200, 4, 'کوشک');
INSERT INTO "iagahi"."City" VALUES (201, 4, 'خوانسار');
INSERT INTO "iagahi"."City" VALUES (202, 4, 'جندق');
INSERT INTO "iagahi"."City" VALUES (203, 4, 'خور');
INSERT INTO "iagahi"."City" VALUES (204, 4, 'فرخی');
INSERT INTO "iagahi"."City" VALUES (205, 4, 'دهاقان');
INSERT INTO "iagahi"."City" VALUES (206, 4, 'گلشن');
INSERT INTO "iagahi"."City" VALUES (207, 4, 'حنا');
INSERT INTO "iagahi"."City" VALUES (208, 4, 'سمیرم');
INSERT INTO "iagahi"."City" VALUES (209, 4, 'کمه');
INSERT INTO "iagahi"."City" VALUES (210, 4, 'ونک');
INSERT INTO "iagahi"."City" VALUES (211, 4, 'شاهین شهر');
INSERT INTO "iagahi"."City" VALUES (212, 4, 'گرگاب');
INSERT INTO "iagahi"."City" VALUES (213, 4, 'گزبرخوار');
INSERT INTO "iagahi"."City" VALUES (214, 4, 'لای بید');
INSERT INTO "iagahi"."City" VALUES (215, 4, 'میمه');
INSERT INTO "iagahi"."City" VALUES (216, 4, 'وزوان');
INSERT INTO "iagahi"."City" VALUES (217, 4, 'شهرضا');
INSERT INTO "iagahi"."City" VALUES (218, 4, 'منظریه');
INSERT INTO "iagahi"."City" VALUES (219, 4, 'داران');
INSERT INTO "iagahi"."City" VALUES (220, 4, 'دامنه');
INSERT INTO "iagahi"."City" VALUES (221, 4, 'برف انبار');
INSERT INTO "iagahi"."City" VALUES (222, 4, 'فریدونشهر');
INSERT INTO "iagahi"."City" VALUES (223, 4, 'ابریشم');
INSERT INTO "iagahi"."City" VALUES (224, 4, 'ایمانشهر');
INSERT INTO "iagahi"."City" VALUES (225, 4, 'بهاران شهر');
INSERT INTO "iagahi"."City" VALUES (226, 4, 'پیربکران');
INSERT INTO "iagahi"."City" VALUES (227, 4, 'زازران');
INSERT INTO "iagahi"."City" VALUES (228, 4, 'فلاورجان');
INSERT INTO "iagahi"."City" VALUES (229, 4, 'قهدریجان');
INSERT INTO "iagahi"."City" VALUES (230, 4, 'کلیشادوسودرجان');
INSERT INTO "iagahi"."City" VALUES (231, 4, 'برزک');
INSERT INTO "iagahi"."City" VALUES (232, 4, 'جوشقان قالی');
INSERT INTO "iagahi"."City" VALUES (233, 4, 'قمصر');
INSERT INTO "iagahi"."City" VALUES (234, 4, 'کاشان');
INSERT INTO "iagahi"."City" VALUES (235, 4, 'کامو و چوگان');
INSERT INTO "iagahi"."City" VALUES (236, 4, 'مشکات');
INSERT INTO "iagahi"."City" VALUES (237, 4, 'نیاسر');
INSERT INTO "iagahi"."City" VALUES (238, 4, 'گلپایگان');
INSERT INTO "iagahi"."City" VALUES (239, 4, 'گلشهر');
INSERT INTO "iagahi"."City" VALUES (240, 4, 'گوگد');
INSERT INTO "iagahi"."City" VALUES (241, 4, 'باغ بهادران');
INSERT INTO "iagahi"."City" VALUES (242, 4, 'باغشاد');
INSERT INTO "iagahi"."City" VALUES (243, 4, 'چرمهین');
INSERT INTO "iagahi"."City" VALUES (244, 4, 'چمگردان');
INSERT INTO "iagahi"."City" VALUES (245, 4, 'زاینده رود');
INSERT INTO "iagahi"."City" VALUES (246, 4, 'زرین شهر');
INSERT INTO "iagahi"."City" VALUES (247, 4, 'سده لنجان');
INSERT INTO "iagahi"."City" VALUES (248, 4, 'فولادشهر');
INSERT INTO "iagahi"."City" VALUES (249, 4, 'ورنامخواست');
INSERT INTO "iagahi"."City" VALUES (250, 4, 'دیزیچه');
INSERT INTO "iagahi"."City" VALUES (251, 4, 'زیباشهر');
INSERT INTO "iagahi"."City" VALUES (252, 4, 'طالخونچه');
INSERT INTO "iagahi"."City" VALUES (253, 4, 'کرکوند');
INSERT INTO "iagahi"."City" VALUES (254, 4, 'مبارکه');
INSERT INTO "iagahi"."City" VALUES (255, 4, 'مجلسی');
INSERT INTO "iagahi"."City" VALUES (256, 4, 'انارک');
INSERT INTO "iagahi"."City" VALUES (257, 4, 'بافران');
INSERT INTO "iagahi"."City" VALUES (258, 4, 'نایین');
INSERT INTO "iagahi"."City" VALUES (259, 4, 'جوزدان');
INSERT INTO "iagahi"."City" VALUES (260, 4, 'دهق');
INSERT INTO "iagahi"."City" VALUES (261, 4, 'علویجه');
INSERT INTO "iagahi"."City" VALUES (262, 4, 'کهریزسنگ');
INSERT INTO "iagahi"."City" VALUES (263, 4, 'گلدشت');
INSERT INTO "iagahi"."City" VALUES (264, 4, 'نجف آباد');
INSERT INTO "iagahi"."City" VALUES (265, 4, 'بادرود');
INSERT INTO "iagahi"."City" VALUES (266, 4, 'خالدآباد');
INSERT INTO "iagahi"."City" VALUES (267, 4, 'طرق رود');
INSERT INTO "iagahi"."City" VALUES (268, 4, 'نطنز');
INSERT INTO "iagahi"."City" VALUES (269, 5, 'اشتهارد');
INSERT INTO "iagahi"."City" VALUES (270, 5, 'چهارباغ');
INSERT INTO "iagahi"."City" VALUES (271, 5, 'شهرجدیدهشتگرد');
INSERT INTO "iagahi"."City" VALUES (272, 5, 'کوهسار');
INSERT INTO "iagahi"."City" VALUES (273, 5, 'گلسار');
INSERT INTO "iagahi"."City" VALUES (274, 5, 'هشتگرد');
INSERT INTO "iagahi"."City" VALUES (275, 5, 'طالقان');
INSERT INTO "iagahi"."City" VALUES (276, 5, 'فردیس');
INSERT INTO "iagahi"."City" VALUES (277, 5, 'مشکین دشت');
INSERT INTO "iagahi"."City" VALUES (278, 5, 'آسارا');
INSERT INTO "iagahi"."City" VALUES (279, 5, 'کرج');
INSERT INTO "iagahi"."City" VALUES (280, 5, 'کمال شهر');
INSERT INTO "iagahi"."City" VALUES (281, 5, 'گرمدره');
INSERT INTO "iagahi"."City" VALUES (282, 5, 'ماهدشت');
INSERT INTO "iagahi"."City" VALUES (283, 5, 'محمدشهر');
INSERT INTO "iagahi"."City" VALUES (284, 5, 'تنکمان');
INSERT INTO "iagahi"."City" VALUES (285, 5, 'نظرآباد');
INSERT INTO "iagahi"."City" VALUES (286, 6, 'آبدانان');
INSERT INTO "iagahi"."City" VALUES (287, 6, 'سراب باغ');
INSERT INTO "iagahi"."City" VALUES (288, 6, 'مورموری');
INSERT INTO "iagahi"."City" VALUES (289, 6, 'ایلام');
INSERT INTO "iagahi"."City" VALUES (290, 6, 'چوار');
INSERT INTO "iagahi"."City" VALUES (291, 6, 'ایوان');
INSERT INTO "iagahi"."City" VALUES (292, 6, 'زرنه');
INSERT INTO "iagahi"."City" VALUES (293, 6, 'بدره');
INSERT INTO "iagahi"."City" VALUES (294, 6, 'آسمان آباد');
INSERT INTO "iagahi"."City" VALUES (295, 6, 'بلاوه');
INSERT INTO "iagahi"."City" VALUES (296, 6, 'توحید');
INSERT INTO "iagahi"."City" VALUES (297, 6, 'سرابله');
INSERT INTO "iagahi"."City" VALUES (298, 6, 'شباب');
INSERT INTO "iagahi"."City" VALUES (299, 6, 'دره شهر');
INSERT INTO "iagahi"."City" VALUES (300, 6, 'ماژین');
INSERT INTO "iagahi"."City" VALUES (301, 6, 'پهله');
INSERT INTO "iagahi"."City" VALUES (302, 6, 'دهلران');
INSERT INTO "iagahi"."City" VALUES (303, 6, 'موسیان');
INSERT INTO "iagahi"."City" VALUES (304, 6, 'میمه');
INSERT INTO "iagahi"."City" VALUES (305, 6, 'لومار');
INSERT INTO "iagahi"."City" VALUES (306, 6, 'ارکواز');
INSERT INTO "iagahi"."City" VALUES (307, 6, 'دلگشا');
INSERT INTO "iagahi"."City" VALUES (308, 6, 'مهر');
INSERT INTO "iagahi"."City" VALUES (309, 6, 'صالح آباد');
INSERT INTO "iagahi"."City" VALUES (310, 6, 'مهران');
INSERT INTO "iagahi"."City" VALUES (311, 7, 'بوشهر');
INSERT INTO "iagahi"."City" VALUES (312, 7, 'چغادک');
INSERT INTO "iagahi"."City" VALUES (313, 7, 'خارک');
INSERT INTO "iagahi"."City" VALUES (314, 7, 'عالی شهر');
INSERT INTO "iagahi"."City" VALUES (315, 7, 'آباد');
INSERT INTO "iagahi"."City" VALUES (316, 7, 'اهرم');
INSERT INTO "iagahi"."City" VALUES (317, 7, 'دلوار');
INSERT INTO "iagahi"."City" VALUES (318, 7, 'انارستان');
INSERT INTO "iagahi"."City" VALUES (319, 7, 'جم');
INSERT INTO "iagahi"."City" VALUES (320, 7, 'ریز');
INSERT INTO "iagahi"."City" VALUES (321, 7, 'آب پخش');
INSERT INTO "iagahi"."City" VALUES (322, 7, 'برازجان');
INSERT INTO "iagahi"."City" VALUES (323, 7, 'بوشکان');
INSERT INTO "iagahi"."City" VALUES (324, 7, 'تنگ ارم');
INSERT INTO "iagahi"."City" VALUES (325, 7, 'دالکی');
INSERT INTO "iagahi"."City" VALUES (326, 7, 'سعد آباد');
INSERT INTO "iagahi"."City" VALUES (327, 7, 'شبانکاره');
INSERT INTO "iagahi"."City" VALUES (328, 7, 'کلمه');
INSERT INTO "iagahi"."City" VALUES (329, 7, 'وحدتیه');
INSERT INTO "iagahi"."City" VALUES (330, 7, 'بادوله');
INSERT INTO "iagahi"."City" VALUES (331, 7, 'خورموج');
INSERT INTO "iagahi"."City" VALUES (332, 7, 'شنبه');
INSERT INTO "iagahi"."City" VALUES (333, 7, 'کاکی');
INSERT INTO "iagahi"."City" VALUES (334, 7, 'آبدان');
INSERT INTO "iagahi"."City" VALUES (335, 7, 'بردخون');
INSERT INTO "iagahi"."City" VALUES (336, 7, 'بردستان');
INSERT INTO "iagahi"."City" VALUES (337, 7, 'بندردیر');
INSERT INTO "iagahi"."City" VALUES (338, 7, 'دوراهک');
INSERT INTO "iagahi"."City" VALUES (339, 7, 'امام حسن');
INSERT INTO "iagahi"."City" VALUES (340, 7, 'بندردیلم');
INSERT INTO "iagahi"."City" VALUES (341, 7, 'عسلویه');
INSERT INTO "iagahi"."City" VALUES (342, 7, 'نخل تقی');
INSERT INTO "iagahi"."City" VALUES (343, 7, 'بندرکنگان');
INSERT INTO "iagahi"."City" VALUES (344, 7, 'بنک');
INSERT INTO "iagahi"."City" VALUES (345, 7, 'سیراف');
INSERT INTO "iagahi"."City" VALUES (346, 7, 'بندرریگ');
INSERT INTO "iagahi"."City" VALUES (347, 7, 'بندرگناوه');
INSERT INTO "iagahi"."City" VALUES (348, 8, 'احمد آباد مستوفی');
INSERT INTO "iagahi"."City" VALUES (349, 8, 'اسلامشهر');
INSERT INTO "iagahi"."City" VALUES (350, 8, 'چهاردانگه');
INSERT INTO "iagahi"."City" VALUES (351, 8, 'صالحیه');
INSERT INTO "iagahi"."City" VALUES (352, 8, 'گلستان');
INSERT INTO "iagahi"."City" VALUES (353, 8, 'نسیم شهر');
INSERT INTO "iagahi"."City" VALUES (354, 8, 'پاکدشت');
INSERT INTO "iagahi"."City" VALUES (355, 8, 'شریف آباد');
INSERT INTO "iagahi"."City" VALUES (356, 8, 'فرون اباد');
INSERT INTO "iagahi"."City" VALUES (357, 8, 'بومهن');
INSERT INTO "iagahi"."City" VALUES (358, 8, 'پردیس');
INSERT INTO "iagahi"."City" VALUES (359, 8, 'پیشوا');
INSERT INTO "iagahi"."City" VALUES (360, 8, 'تهران');
INSERT INTO "iagahi"."City" VALUES (361, 8, 'آبسرد');
INSERT INTO "iagahi"."City" VALUES (362, 8, 'آبعلی');
INSERT INTO "iagahi"."City" VALUES (363, 8, 'دماوند');
INSERT INTO "iagahi"."City" VALUES (364, 8, 'رودهن');
INSERT INTO "iagahi"."City" VALUES (365, 8, 'کیلان');
INSERT INTO "iagahi"."City" VALUES (366, 8, 'پرند');
INSERT INTO "iagahi"."City" VALUES (367, 8, 'رباطکریم');
INSERT INTO "iagahi"."City" VALUES (368, 8, 'نصیرشهر');
INSERT INTO "iagahi"."City" VALUES (369, 8, 'باقرشهر');
INSERT INTO "iagahi"."City" VALUES (370, 8, 'حسن آباد');
INSERT INTO "iagahi"."City" VALUES (371, 8, 'ری');
INSERT INTO "iagahi"."City" VALUES (372, 8, 'کهریزک');
INSERT INTO "iagahi"."City" VALUES (373, 8, 'تجریش');
INSERT INTO "iagahi"."City" VALUES (374, 8, 'شمشک');
INSERT INTO "iagahi"."City" VALUES (375, 8, 'فشم');
INSERT INTO "iagahi"."City" VALUES (376, 8, 'لواسان');
INSERT INTO "iagahi"."City" VALUES (377, 8, 'اندیشه');
INSERT INTO "iagahi"."City" VALUES (378, 8, 'باغستان');
INSERT INTO "iagahi"."City" VALUES (379, 8, 'شاهدشهر');
INSERT INTO "iagahi"."City" VALUES (380, 8, 'شهریار');
INSERT INTO "iagahi"."City" VALUES (381, 8, 'صباشهر');
INSERT INTO "iagahi"."City" VALUES (382, 8, 'فردوسیه');
INSERT INTO "iagahi"."City" VALUES (383, 8, 'وحیدیه');
INSERT INTO "iagahi"."City" VALUES (384, 8, 'ارجمند');
INSERT INTO "iagahi"."City" VALUES (385, 8, 'فیروزکوه');
INSERT INTO "iagahi"."City" VALUES (386, 8, 'قدس');
INSERT INTO "iagahi"."City" VALUES (387, 8, 'قرچک');
INSERT INTO "iagahi"."City" VALUES (388, 8, 'صفادشت');
INSERT INTO "iagahi"."City" VALUES (389, 8, 'ملارد');
INSERT INTO "iagahi"."City" VALUES (390, 8, 'جوادآباد');
INSERT INTO "iagahi"."City" VALUES (391, 8, 'ورامین');
INSERT INTO "iagahi"."City" VALUES (392, 9, 'اردل');
INSERT INTO "iagahi"."City" VALUES (393, 9, 'دشتک');
INSERT INTO "iagahi"."City" VALUES (394, 9, 'سرخون');
INSERT INTO "iagahi"."City" VALUES (395, 9, 'کاج');
INSERT INTO "iagahi"."City" VALUES (396, 9, 'بروجن');
INSERT INTO "iagahi"."City" VALUES (397, 9, 'بلداجی');
INSERT INTO "iagahi"."City" VALUES (398, 9, 'سفیددشت');
INSERT INTO "iagahi"."City" VALUES (399, 9, 'فرادبنه');
INSERT INTO "iagahi"."City" VALUES (400, 9, 'گندمان');
INSERT INTO "iagahi"."City" VALUES (401, 9, 'نقنه');
INSERT INTO "iagahi"."City" VALUES (402, 9, 'بن');
INSERT INTO "iagahi"."City" VALUES (403, 9, 'وردنجان');
INSERT INTO "iagahi"."City" VALUES (404, 9, 'سامان');
INSERT INTO "iagahi"."City" VALUES (405, 9, 'سودجان');
INSERT INTO "iagahi"."City" VALUES (406, 9, 'سورشجان');
INSERT INTO "iagahi"."City" VALUES (407, 9, 'شهرکرد');
INSERT INTO "iagahi"."City" VALUES (408, 9, 'طاقانک');
INSERT INTO "iagahi"."City" VALUES (409, 9, 'فرخ شهر');
INSERT INTO "iagahi"."City" VALUES (410, 9, 'کیان');
INSERT INTO "iagahi"."City" VALUES (411, 9, 'نافچ');
INSERT INTO "iagahi"."City" VALUES (412, 9, 'هارونی');
INSERT INTO "iagahi"."City" VALUES (413, 9, 'هفشجان');
INSERT INTO "iagahi"."City" VALUES (414, 9, 'باباحیدر');
INSERT INTO "iagahi"."City" VALUES (415, 9, 'پردنجان');
INSERT INTO "iagahi"."City" VALUES (416, 9, 'جونقان');
INSERT INTO "iagahi"."City" VALUES (417, 9, 'چلیچه');
INSERT INTO "iagahi"."City" VALUES (418, 9, 'فارسان');
INSERT INTO "iagahi"."City" VALUES (419, 9, 'گوجان');
INSERT INTO "iagahi"."City" VALUES (420, 9, 'بازفت');
INSERT INTO "iagahi"."City" VALUES (421, 9, 'چلگرد');
INSERT INTO "iagahi"."City" VALUES (422, 9, 'صمصامی');
INSERT INTO "iagahi"."City" VALUES (423, 9, 'دستنا');
INSERT INTO "iagahi"."City" VALUES (424, 9, 'شلمزار');
INSERT INTO "iagahi"."City" VALUES (425, 9, 'گهرو');
INSERT INTO "iagahi"."City" VALUES (426, 9, 'ناغان');
INSERT INTO "iagahi"."City" VALUES (427, 9, 'آلونی');
INSERT INTO "iagahi"."City" VALUES (428, 9, 'سردشت');
INSERT INTO "iagahi"."City" VALUES (429, 9, 'لردگان');
INSERT INTO "iagahi"."City" VALUES (430, 9, 'مال خلیفه');
INSERT INTO "iagahi"."City" VALUES (431, 9, 'منج');
INSERT INTO "iagahi"."City" VALUES (432, 10, 'ارسک');
INSERT INTO "iagahi"."City" VALUES (433, 10, 'بشرویه');
INSERT INTO "iagahi"."City" VALUES (434, 10, 'بیرجند');
INSERT INTO "iagahi"."City" VALUES (435, 10, 'خوسف');
INSERT INTO "iagahi"."City" VALUES (436, 10, 'محمدشهر');
INSERT INTO "iagahi"."City" VALUES (437, 10, 'اسدیه');
INSERT INTO "iagahi"."City" VALUES (438, 10, 'طبس مسینا');
INSERT INTO "iagahi"."City" VALUES (439, 10, 'قهستان');
INSERT INTO "iagahi"."City" VALUES (440, 10, 'گزیک');
INSERT INTO "iagahi"."City" VALUES (441, 10, 'حاجی آباد');
INSERT INTO "iagahi"."City" VALUES (442, 10, 'زهان');
INSERT INTO "iagahi"."City" VALUES (443, 10, 'آیسک');
INSERT INTO "iagahi"."City" VALUES (444, 10, 'سرایان');
INSERT INTO "iagahi"."City" VALUES (445, 10, 'سه قلعه');
INSERT INTO "iagahi"."City" VALUES (446, 10, 'سربیشه');
INSERT INTO "iagahi"."City" VALUES (447, 10, 'مود');
INSERT INTO "iagahi"."City" VALUES (448, 10, 'دیهوک');
INSERT INTO "iagahi"."City" VALUES (449, 10, 'طبس');
INSERT INTO "iagahi"."City" VALUES (450, 10, 'عشق آباد');
INSERT INTO "iagahi"."City" VALUES (451, 10, 'اسلامیه');
INSERT INTO "iagahi"."City" VALUES (452, 10, 'فردوس');
INSERT INTO "iagahi"."City" VALUES (453, 10, 'آرین شهر');
INSERT INTO "iagahi"."City" VALUES (454, 10, 'اسفدن');
INSERT INTO "iagahi"."City" VALUES (455, 10, 'خضری دشت بیاض');
INSERT INTO "iagahi"."City" VALUES (456, 10, 'قاین');
INSERT INTO "iagahi"."City" VALUES (457, 10, 'نیمبلوک');
INSERT INTO "iagahi"."City" VALUES (458, 10, 'شوسف');
INSERT INTO "iagahi"."City" VALUES (459, 10, 'نهبندان');
INSERT INTO "iagahi"."City" VALUES (460, 11, 'باخرز');
INSERT INTO "iagahi"."City" VALUES (461, 11, 'بجستان');
INSERT INTO "iagahi"."City" VALUES (462, 11, 'یونسی');
INSERT INTO "iagahi"."City" VALUES (463, 11, 'انابد');
INSERT INTO "iagahi"."City" VALUES (464, 11, 'بردسکن');
INSERT INTO "iagahi"."City" VALUES (465, 11, 'شهراباد');
INSERT INTO "iagahi"."City" VALUES (466, 11, 'شاندیز');
INSERT INTO "iagahi"."City" VALUES (467, 11, 'طرقبه');
INSERT INTO "iagahi"."City" VALUES (468, 11, 'تایباد');
INSERT INTO "iagahi"."City" VALUES (469, 11, 'کاریز');
INSERT INTO "iagahi"."City" VALUES (470, 11, 'مشهدریزه');
INSERT INTO "iagahi"."City" VALUES (471, 11, 'احمدابادصولت');
INSERT INTO "iagahi"."City" VALUES (472, 11, 'تربت جام');
INSERT INTO "iagahi"."City" VALUES (473, 11, 'صالح آباد');
INSERT INTO "iagahi"."City" VALUES (474, 11, 'نصرآباد');
INSERT INTO "iagahi"."City" VALUES (475, 11, 'نیل شهر');
INSERT INTO "iagahi"."City" VALUES (476, 11, 'بایک');
INSERT INTO "iagahi"."City" VALUES (477, 11, 'تربت حیدریه');
INSERT INTO "iagahi"."City" VALUES (478, 11, 'رباط سنگ');
INSERT INTO "iagahi"."City" VALUES (479, 11, 'کدکن');
INSERT INTO "iagahi"."City" VALUES (480, 11, 'جغتای');
INSERT INTO "iagahi"."City" VALUES (481, 11, 'نقاب');
INSERT INTO "iagahi"."City" VALUES (482, 11, 'چناران');
INSERT INTO "iagahi"."City" VALUES (483, 11, 'گلبهار');
INSERT INTO "iagahi"."City" VALUES (484, 11, 'گلمکان');
INSERT INTO "iagahi"."City" VALUES (485, 11, 'خلیل آباد');
INSERT INTO "iagahi"."City" VALUES (486, 11, 'کندر');
INSERT INTO "iagahi"."City" VALUES (487, 11, 'خواف');
INSERT INTO "iagahi"."City" VALUES (488, 11, 'سلامی');
INSERT INTO "iagahi"."City" VALUES (489, 11, 'سنگان');
INSERT INTO "iagahi"."City" VALUES (490, 11, 'قاسم آباد');
INSERT INTO "iagahi"."City" VALUES (491, 11, 'نشتیفان');
INSERT INTO "iagahi"."City" VALUES (492, 11, 'سلطان آباد');
INSERT INTO "iagahi"."City" VALUES (493, 11, 'داورزن');
INSERT INTO "iagahi"."City" VALUES (494, 11, 'چاپشلو');
INSERT INTO "iagahi"."City" VALUES (495, 11, 'درگز');
INSERT INTO "iagahi"."City" VALUES (496, 11, 'لطف آباد');
INSERT INTO "iagahi"."City" VALUES (497, 11, 'نوخندان');
INSERT INTO "iagahi"."City" VALUES (498, 11, 'جنگل');
INSERT INTO "iagahi"."City" VALUES (499, 11, 'رشتخوار');
INSERT INTO "iagahi"."City" VALUES (500, 11, 'دولت آباد');
INSERT INTO "iagahi"."City" VALUES (501, 11, 'روداب');
INSERT INTO "iagahi"."City" VALUES (502, 11, 'سبزوار');
INSERT INTO "iagahi"."City" VALUES (503, 11, 'ششتمد');
INSERT INTO "iagahi"."City" VALUES (504, 11, 'سرخس');
INSERT INTO "iagahi"."City" VALUES (505, 11, 'مزدآوند');
INSERT INTO "iagahi"."City" VALUES (506, 11, 'سفیدسنگ');
INSERT INTO "iagahi"."City" VALUES (507, 11, 'فرهادگرد');
INSERT INTO "iagahi"."City" VALUES (508, 11, 'فریمان');
INSERT INTO "iagahi"."City" VALUES (509, 11, 'قلندرآباد');
INSERT INTO "iagahi"."City" VALUES (510, 11, 'فیروزه');
INSERT INTO "iagahi"."City" VALUES (511, 11, 'همت آباد');
INSERT INTO "iagahi"."City" VALUES (512, 11, 'باجگیران');
INSERT INTO "iagahi"."City" VALUES (513, 11, 'قوچان');
INSERT INTO "iagahi"."City" VALUES (514, 11, 'ریوش');
INSERT INTO "iagahi"."City" VALUES (515, 11, 'کاشمر');
INSERT INTO "iagahi"."City" VALUES (516, 11, 'شهرزو');
INSERT INTO "iagahi"."City" VALUES (517, 11, 'کلات');
INSERT INTO "iagahi"."City" VALUES (518, 11, 'بیدخت');
INSERT INTO "iagahi"."City" VALUES (519, 11, 'کاخک');
INSERT INTO "iagahi"."City" VALUES (520, 11, 'گناباد');
INSERT INTO "iagahi"."City" VALUES (521, 11, 'رضویه');
INSERT INTO "iagahi"."City" VALUES (522, 11, 'مشهد');
INSERT INTO "iagahi"."City" VALUES (523, 11, 'مشهد ثامن');
INSERT INTO "iagahi"."City" VALUES (524, 11, 'ملک آباد');
INSERT INTO "iagahi"."City" VALUES (525, 11, 'شادمهر');
INSERT INTO "iagahi"."City" VALUES (526, 11, 'فیض آباد');
INSERT INTO "iagahi"."City" VALUES (527, 11, 'بار');
INSERT INTO "iagahi"."City" VALUES (528, 11, 'چکنه');
INSERT INTO "iagahi"."City" VALUES (529, 11, 'خرو');
INSERT INTO "iagahi"."City" VALUES (530, 11, 'درود');
INSERT INTO "iagahi"."City" VALUES (531, 11, 'عشق آباد');
INSERT INTO "iagahi"."City" VALUES (532, 11, 'قدمگاه');
INSERT INTO "iagahi"."City" VALUES (533, 11, 'نیشابور');
INSERT INTO "iagahi"."City" VALUES (534, 12, 'اسفراین');
INSERT INTO "iagahi"."City" VALUES (535, 12, 'صفی آباد');
INSERT INTO "iagahi"."City" VALUES (536, 12, 'بجنورد');
INSERT INTO "iagahi"."City" VALUES (537, 12, 'چناران شهر');
INSERT INTO "iagahi"."City" VALUES (538, 12, 'حصارگرمخان');
INSERT INTO "iagahi"."City" VALUES (539, 12, 'جاجرم');
INSERT INTO "iagahi"."City" VALUES (540, 12, 'سنخواست');
INSERT INTO "iagahi"."City" VALUES (541, 12, 'شوقان');
INSERT INTO "iagahi"."City" VALUES (542, 12, 'راز');
INSERT INTO "iagahi"."City" VALUES (543, 12, 'زیارت');
INSERT INTO "iagahi"."City" VALUES (544, 12, 'شیروان');
INSERT INTO "iagahi"."City" VALUES (545, 12, 'قوشخانه');
INSERT INTO "iagahi"."City" VALUES (546, 12, 'لوجلی');
INSERT INTO "iagahi"."City" VALUES (547, 12, 'تیتکانلو');
INSERT INTO "iagahi"."City" VALUES (548, 12, 'فاروج');
INSERT INTO "iagahi"."City" VALUES (549, 12, 'ایور');
INSERT INTO "iagahi"."City" VALUES (550, 12, 'درق');
INSERT INTO "iagahi"."City" VALUES (551, 12, 'گرمه');
INSERT INTO "iagahi"."City" VALUES (552, 12, 'آشخانه');
INSERT INTO "iagahi"."City" VALUES (553, 12, 'آوا');
INSERT INTO "iagahi"."City" VALUES (554, 12, 'پیش قلعه');
INSERT INTO "iagahi"."City" VALUES (555, 12, 'قاضی');
INSERT INTO "iagahi"."City" VALUES (556, 13, 'آبادان');
INSERT INTO "iagahi"."City" VALUES (557, 13, 'اروندکنار');
INSERT INTO "iagahi"."City" VALUES (558, 13, 'چویبده');
INSERT INTO "iagahi"."City" VALUES (559, 13, 'آغاجاری');
INSERT INTO "iagahi"."City" VALUES (560, 13, 'امیدیه');
INSERT INTO "iagahi"."City" VALUES (561, 13, 'جایزان');
INSERT INTO "iagahi"."City" VALUES (562, 13, 'آبژدان');
INSERT INTO "iagahi"."City" VALUES (563, 13, 'قلعه خواجه');
INSERT INTO "iagahi"."City" VALUES (564, 13, 'آزادی');
INSERT INTO "iagahi"."City" VALUES (565, 13, 'اندیمشک');
INSERT INTO "iagahi"."City" VALUES (566, 13, 'بیدروبه');
INSERT INTO "iagahi"."City" VALUES (567, 13, 'چم گلک');
INSERT INTO "iagahi"."City" VALUES (568, 13, 'حسینیه');
INSERT INTO "iagahi"."City" VALUES (569, 13, 'الهایی');
INSERT INTO "iagahi"."City" VALUES (570, 13, 'اهواز');
INSERT INTO "iagahi"."City" VALUES (571, 13, 'ایذه');
INSERT INTO "iagahi"."City" VALUES (572, 13, 'دهدز');
INSERT INTO "iagahi"."City" VALUES (573, 13, 'باغ ملک');
INSERT INTO "iagahi"."City" VALUES (574, 13, 'صیدون');
INSERT INTO "iagahi"."City" VALUES (575, 13, 'قلعه تل');
INSERT INTO "iagahi"."City" VALUES (576, 13, 'میداود');
INSERT INTO "iagahi"."City" VALUES (577, 13, 'شیبان');
INSERT INTO "iagahi"."City" VALUES (578, 13, 'ملاثانی');
INSERT INTO "iagahi"."City" VALUES (579, 13, 'ویس');
INSERT INTO "iagahi"."City" VALUES (580, 13, 'بندرامام خمینی');
INSERT INTO "iagahi"."City" VALUES (581, 13, 'بندرماهشهر');
INSERT INTO "iagahi"."City" VALUES (582, 13, 'چمران');
INSERT INTO "iagahi"."City" VALUES (583, 13, 'بهبهان');
INSERT INTO "iagahi"."City" VALUES (584, 13, 'تشان');
INSERT INTO "iagahi"."City" VALUES (585, 13, 'سردشت');
INSERT INTO "iagahi"."City" VALUES (586, 13, 'منصوریه');
INSERT INTO "iagahi"."City" VALUES (587, 13, 'حمیدیه');
INSERT INTO "iagahi"."City" VALUES (588, 13, 'خرمشهر');
INSERT INTO "iagahi"."City" VALUES (589, 13, 'مقاومت');
INSERT INTO "iagahi"."City" VALUES (590, 13, 'مینوشهر');
INSERT INTO "iagahi"."City" VALUES (591, 13, 'چغامیش');
INSERT INTO "iagahi"."City" VALUES (592, 13, 'حمزه');
INSERT INTO "iagahi"."City" VALUES (593, 13, 'دزفول');
INSERT INTO "iagahi"."City" VALUES (594, 13, 'سالند');
INSERT INTO "iagahi"."City" VALUES (595, 13, 'سیاه منصور');
INSERT INTO "iagahi"."City" VALUES (596, 13, 'شمس آباد');
INSERT INTO "iagahi"."City" VALUES (597, 13, 'شهر امام');
INSERT INTO "iagahi"."City" VALUES (598, 13, 'صفی آباد');
INSERT INTO "iagahi"."City" VALUES (599, 13, 'میانرود');
INSERT INTO "iagahi"."City" VALUES (600, 13, 'ابوحمیظه');
INSERT INTO "iagahi"."City" VALUES (601, 13, 'بستان');
INSERT INTO "iagahi"."City" VALUES (602, 13, 'سوسنگرد');
INSERT INTO "iagahi"."City" VALUES (603, 13, 'کوت سیدنعیم');
INSERT INTO "iagahi"."City" VALUES (604, 13, 'رامشیر');
INSERT INTO "iagahi"."City" VALUES (605, 13, 'مشراگه');
INSERT INTO "iagahi"."City" VALUES (606, 13, 'رامهرمز');
INSERT INTO "iagahi"."City" VALUES (607, 13, 'خنافره');
INSERT INTO "iagahi"."City" VALUES (608, 13, 'دارخوین');
INSERT INTO "iagahi"."City" VALUES (609, 13, 'شادگان');
INSERT INTO "iagahi"."City" VALUES (610, 13, 'الوان');
INSERT INTO "iagahi"."City" VALUES (611, 13, 'حر');
INSERT INTO "iagahi"."City" VALUES (612, 13, 'شاوور');
INSERT INTO "iagahi"."City" VALUES (613, 13, 'شوش');
INSERT INTO "iagahi"."City" VALUES (614, 13, 'فتح المبین');
INSERT INTO "iagahi"."City" VALUES (615, 13, 'سرداران');
INSERT INTO "iagahi"."City" VALUES (616, 13, 'شرافت');
INSERT INTO "iagahi"."City" VALUES (617, 13, 'شوشتر');
INSERT INTO "iagahi"."City" VALUES (618, 13, 'گوریه');
INSERT INTO "iagahi"."City" VALUES (619, 13, 'کوت عبداله');
INSERT INTO "iagahi"."City" VALUES (620, 13, 'ترکالکی');
INSERT INTO "iagahi"."City" VALUES (621, 13, 'جنت مکان');
INSERT INTO "iagahi"."City" VALUES (622, 13, 'سماله');
INSERT INTO "iagahi"."City" VALUES (623, 13, 'صالح شهر');
INSERT INTO "iagahi"."City" VALUES (624, 13, 'گتوند');
INSERT INTO "iagahi"."City" VALUES (625, 13, 'لالی');
INSERT INTO "iagahi"."City" VALUES (626, 13, 'گلگیر');
INSERT INTO "iagahi"."City" VALUES (627, 13, 'مسجدسلیمان');
INSERT INTO "iagahi"."City" VALUES (628, 13, 'هفتگل');
INSERT INTO "iagahi"."City" VALUES (629, 13, 'زهره');
INSERT INTO "iagahi"."City" VALUES (630, 13, 'هندیجان');
INSERT INTO "iagahi"."City" VALUES (631, 13, 'رفیع');
INSERT INTO "iagahi"."City" VALUES (632, 13, 'هویزه');
INSERT INTO "iagahi"."City" VALUES (633, 14, 'ابهر');
INSERT INTO "iagahi"."City" VALUES (634, 14, 'صایین قلعه');
INSERT INTO "iagahi"."City" VALUES (635, 14, 'هیدج');
INSERT INTO "iagahi"."City" VALUES (636, 14, 'حلب');
INSERT INTO "iagahi"."City" VALUES (637, 14, 'زرین آباد');
INSERT INTO "iagahi"."City" VALUES (638, 14, 'زرین رود');
INSERT INTO "iagahi"."City" VALUES (639, 14, 'سجاس');
INSERT INTO "iagahi"."City" VALUES (640, 14, 'سهرورد');
INSERT INTO "iagahi"."City" VALUES (641, 14, 'قیدار');
INSERT INTO "iagahi"."City" VALUES (642, 14, 'کرسف');
INSERT INTO "iagahi"."City" VALUES (643, 14, 'گرماب');
INSERT INTO "iagahi"."City" VALUES (644, 14, 'نوربهار');
INSERT INTO "iagahi"."City" VALUES (645, 14, 'خرمدره');
INSERT INTO "iagahi"."City" VALUES (646, 14, 'ارمغانخانه');
INSERT INTO "iagahi"."City" VALUES (647, 14, 'زنجان');
INSERT INTO "iagahi"."City" VALUES (648, 14, 'نیک پی');
INSERT INTO "iagahi"."City" VALUES (649, 14, 'سلطانیه');
INSERT INTO "iagahi"."City" VALUES (650, 14, 'آب بر');
INSERT INTO "iagahi"."City" VALUES (651, 14, 'چورزق');
INSERT INTO "iagahi"."City" VALUES (652, 14, 'دندی');
INSERT INTO "iagahi"."City" VALUES (653, 14, 'ماه نشان');
INSERT INTO "iagahi"."City" VALUES (654, 15, 'آرادان');
INSERT INTO "iagahi"."City" VALUES (655, 15, 'کهن آباد');
INSERT INTO "iagahi"."City" VALUES (656, 15, 'امیریه');
INSERT INTO "iagahi"."City" VALUES (657, 15, 'دامغان');
INSERT INTO "iagahi"."City" VALUES (658, 15, 'دیباج');
INSERT INTO "iagahi"."City" VALUES (659, 15, 'کلاته');
INSERT INTO "iagahi"."City" VALUES (660, 15, 'سرخه');
INSERT INTO "iagahi"."City" VALUES (661, 15, 'سمنان');
INSERT INTO "iagahi"."City" VALUES (662, 15, 'بسطام');
INSERT INTO "iagahi"."City" VALUES (663, 15, 'بیارجمند');
INSERT INTO "iagahi"."City" VALUES (664, 15, 'رودیان');
INSERT INTO "iagahi"."City" VALUES (665, 15, 'شاهرود');
INSERT INTO "iagahi"."City" VALUES (666, 15, 'کلاته خیج');
INSERT INTO "iagahi"."City" VALUES (667, 15, 'مجن');
INSERT INTO "iagahi"."City" VALUES (668, 15, 'ایوانکی');
INSERT INTO "iagahi"."City" VALUES (669, 15, 'گرمسار');
INSERT INTO "iagahi"."City" VALUES (670, 15, 'درجزین');
INSERT INTO "iagahi"."City" VALUES (671, 15, 'شهمیرزاد');
INSERT INTO "iagahi"."City" VALUES (672, 15, 'مهدی شهر');
INSERT INTO "iagahi"."City" VALUES (673, 15, 'میامی');
INSERT INTO "iagahi"."City" VALUES (674, 16, 'ایرانشهر');
INSERT INTO "iagahi"."City" VALUES (675, 16, 'بزمان');
INSERT INTO "iagahi"."City" VALUES (676, 16, 'بمپور');
INSERT INTO "iagahi"."City" VALUES (677, 16, 'محمدان');
INSERT INTO "iagahi"."City" VALUES (678, 16, 'چابهار');
INSERT INTO "iagahi"."City" VALUES (679, 16, 'نگور');
INSERT INTO "iagahi"."City" VALUES (680, 16, 'خاش');
INSERT INTO "iagahi"."City" VALUES (681, 16, 'نوک آباد');
INSERT INTO "iagahi"."City" VALUES (682, 16, 'گلمورتی');
INSERT INTO "iagahi"."City" VALUES (683, 16, 'بنجار');
INSERT INTO "iagahi"."City" VALUES (684, 16, 'زابل');
INSERT INTO "iagahi"."City" VALUES (685, 16, 'زاهدان');
INSERT INTO "iagahi"."City" VALUES (686, 16, 'نصرت آباد');
INSERT INTO "iagahi"."City" VALUES (687, 16, 'زهک');
INSERT INTO "iagahi"."City" VALUES (688, 16, 'جالق');
INSERT INTO "iagahi"."City" VALUES (689, 16, 'سراوان');
INSERT INTO "iagahi"."City" VALUES (690, 16, 'سیرکان');
INSERT INTO "iagahi"."City" VALUES (691, 16, 'گشت');
INSERT INTO "iagahi"."City" VALUES (692, 16, 'محمدی');
INSERT INTO "iagahi"."City" VALUES (693, 16, 'پیشین');
INSERT INTO "iagahi"."City" VALUES (694, 16, 'راسک');
INSERT INTO "iagahi"."City" VALUES (695, 16, 'سرباز');
INSERT INTO "iagahi"."City" VALUES (696, 16, 'سوران');
INSERT INTO "iagahi"."City" VALUES (697, 16, 'هیدوچ');
INSERT INTO "iagahi"."City" VALUES (698, 16, 'فنوج');
INSERT INTO "iagahi"."City" VALUES (699, 16, 'قصرقند');
INSERT INTO "iagahi"."City" VALUES (700, 16, 'زرآباد');
INSERT INTO "iagahi"."City" VALUES (701, 16, 'کنارک');
INSERT INTO "iagahi"."City" VALUES (702, 16, 'مهرستان');
INSERT INTO "iagahi"."City" VALUES (703, 16, 'میرجاوه');
INSERT INTO "iagahi"."City" VALUES (704, 16, 'اسپکه');
INSERT INTO "iagahi"."City" VALUES (705, 16, 'بنت');
INSERT INTO "iagahi"."City" VALUES (706, 16, 'نیک شهر');
INSERT INTO "iagahi"."City" VALUES (707, 16, 'ادیمی');
INSERT INTO "iagahi"."City" VALUES (708, 16, 'شهرک علی اکبر');
INSERT INTO "iagahi"."City" VALUES (709, 16, 'محمدآباد');
INSERT INTO "iagahi"."City" VALUES (710, 16, 'دوست محمد');
INSERT INTO "iagahi"."City" VALUES (711, 17, 'آباده');
INSERT INTO "iagahi"."City" VALUES (712, 17, 'ایزدخواست');
INSERT INTO "iagahi"."City" VALUES (713, 17, 'بهمن');
INSERT INTO "iagahi"."City" VALUES (714, 17, 'سورمق');
INSERT INTO "iagahi"."City" VALUES (715, 17, 'صغاد');
INSERT INTO "iagahi"."City" VALUES (716, 17, 'ارسنجان');
INSERT INTO "iagahi"."City" VALUES (717, 17, 'استهبان');
INSERT INTO "iagahi"."City" VALUES (718, 17, 'ایج');
INSERT INTO "iagahi"."City" VALUES (719, 17, 'رونیز');
INSERT INTO "iagahi"."City" VALUES (720, 17, 'اقلید');
INSERT INTO "iagahi"."City" VALUES (721, 17, 'حسن اباد');
INSERT INTO "iagahi"."City" VALUES (722, 17, 'دژکرد');
INSERT INTO "iagahi"."City" VALUES (723, 17, 'سده');
INSERT INTO "iagahi"."City" VALUES (724, 17, 'بوانات');
INSERT INTO "iagahi"."City" VALUES (725, 17, 'حسامی');
INSERT INTO "iagahi"."City" VALUES (726, 17, 'کره ای');
INSERT INTO "iagahi"."City" VALUES (727, 17, 'مزایجان');
INSERT INTO "iagahi"."City" VALUES (728, 17, 'سعادت شهر');
INSERT INTO "iagahi"."City" VALUES (729, 17, 'مادرسلیمان');
INSERT INTO "iagahi"."City" VALUES (730, 17, 'باب انار');
INSERT INTO "iagahi"."City" VALUES (731, 17, 'جهرم');
INSERT INTO "iagahi"."City" VALUES (732, 17, 'خاوران');
INSERT INTO "iagahi"."City" VALUES (733, 17, 'دوزه');
INSERT INTO "iagahi"."City" VALUES (734, 17, 'قطب آباد');
INSERT INTO "iagahi"."City" VALUES (735, 17, 'خرامه');
INSERT INTO "iagahi"."City" VALUES (736, 17, 'سلطان شهر');
INSERT INTO "iagahi"."City" VALUES (737, 17, 'صفاشهر');
INSERT INTO "iagahi"."City" VALUES (738, 17, 'قادراباد');
INSERT INTO "iagahi"."City" VALUES (739, 17, 'خنج');
INSERT INTO "iagahi"."City" VALUES (740, 17, 'جنت شهر');
INSERT INTO "iagahi"."City" VALUES (741, 17, 'داراب');
INSERT INTO "iagahi"."City" VALUES (742, 17, 'دوبرجی');
INSERT INTO "iagahi"."City" VALUES (743, 17, 'فدامی');
INSERT INTO "iagahi"."City" VALUES (744, 17, 'کوپن');
INSERT INTO "iagahi"."City" VALUES (745, 17, 'مصیری');
INSERT INTO "iagahi"."City" VALUES (746, 17, 'حاجی آباد');
INSERT INTO "iagahi"."City" VALUES (747, 17, 'دبیران');
INSERT INTO "iagahi"."City" VALUES (748, 17, 'شهرپیر');
INSERT INTO "iagahi"."City" VALUES (749, 17, 'اردکان');
INSERT INTO "iagahi"."City" VALUES (750, 17, 'بیضا');
INSERT INTO "iagahi"."City" VALUES (751, 17, 'هماشهر');
INSERT INTO "iagahi"."City" VALUES (752, 17, 'سروستان');
INSERT INTO "iagahi"."City" VALUES (753, 17, 'کوهنجان');
INSERT INTO "iagahi"."City" VALUES (754, 17, 'خانه زنیان');
INSERT INTO "iagahi"."City" VALUES (755, 17, 'داریان');
INSERT INTO "iagahi"."City" VALUES (756, 17, 'زرقان');
INSERT INTO "iagahi"."City" VALUES (757, 17, 'شهرصدرا');
INSERT INTO "iagahi"."City" VALUES (758, 17, 'شیراز');
INSERT INTO "iagahi"."City" VALUES (759, 17, 'لپویی');
INSERT INTO "iagahi"."City" VALUES (760, 17, 'دهرم');
INSERT INTO "iagahi"."City" VALUES (761, 17, 'فراشبند');
INSERT INTO "iagahi"."City" VALUES (762, 17, 'نوجین');
INSERT INTO "iagahi"."City" VALUES (763, 17, 'زاهدشهر');
INSERT INTO "iagahi"."City" VALUES (764, 17, 'ششده');
INSERT INTO "iagahi"."City" VALUES (765, 17, 'فسا');
INSERT INTO "iagahi"."City" VALUES (766, 17, 'قره بلاغ');
INSERT INTO "iagahi"."City" VALUES (767, 17, 'میانشهر');
INSERT INTO "iagahi"."City" VALUES (768, 17, 'نوبندگان');
INSERT INTO "iagahi"."City" VALUES (769, 17, 'فیروزآباد');
INSERT INTO "iagahi"."City" VALUES (770, 17, 'میمند');
INSERT INTO "iagahi"."City" VALUES (771, 17, 'افزر');
INSERT INTO "iagahi"."City" VALUES (772, 17, 'امام شهر');
INSERT INTO "iagahi"."City" VALUES (773, 17, 'قیر');
INSERT INTO "iagahi"."City" VALUES (774, 17, 'کارزین (فتح آباد)');
INSERT INTO "iagahi"."City" VALUES (775, 17, 'مبارک آباددیز');
INSERT INTO "iagahi"."City" VALUES (776, 17, 'بالاده');
INSERT INTO "iagahi"."City" VALUES (777, 17, 'خشت');
INSERT INTO "iagahi"."City" VALUES (778, 17, 'قایمیه');
INSERT INTO "iagahi"."City" VALUES (779, 17, 'کازرون');
INSERT INTO "iagahi"."City" VALUES (780, 17, 'کنارتخته');
INSERT INTO "iagahi"."City" VALUES (781, 17, 'نودان');
INSERT INTO "iagahi"."City" VALUES (782, 17, 'کوار');
INSERT INTO "iagahi"."City" VALUES (783, 17, 'گراش');
INSERT INTO "iagahi"."City" VALUES (784, 17, 'اوز');
INSERT INTO "iagahi"."City" VALUES (785, 17, 'بنارویه');
INSERT INTO "iagahi"."City" VALUES (786, 17, 'بیرم');
INSERT INTO "iagahi"."City" VALUES (787, 17, 'جویم');
INSERT INTO "iagahi"."City" VALUES (788, 17, 'خور');
INSERT INTO "iagahi"."City" VALUES (789, 17, 'عمادده');
INSERT INTO "iagahi"."City" VALUES (790, 17, 'لار');
INSERT INTO "iagahi"."City" VALUES (791, 17, 'لطیفی');
INSERT INTO "iagahi"."City" VALUES (792, 17, 'اشکنان');
INSERT INTO "iagahi"."City" VALUES (793, 17, 'اهل');
INSERT INTO "iagahi"."City" VALUES (794, 17, 'علامرودشت');
INSERT INTO "iagahi"."City" VALUES (795, 17, 'لامرد');
INSERT INTO "iagahi"."City" VALUES (796, 17, 'خانیمن');
INSERT INTO "iagahi"."City" VALUES (797, 17, 'رامجرد');
INSERT INTO "iagahi"."City" VALUES (798, 17, 'سیدان');
INSERT INTO "iagahi"."City" VALUES (799, 17, 'کامفیروز');
INSERT INTO "iagahi"."City" VALUES (800, 17, 'مرودشت');
INSERT INTO "iagahi"."City" VALUES (801, 17, 'بابامنیر');
INSERT INTO "iagahi"."City" VALUES (802, 17, 'خومه زار');
INSERT INTO "iagahi"."City" VALUES (803, 17, 'نورآباد');
INSERT INTO "iagahi"."City" VALUES (804, 17, 'اسیر');
INSERT INTO "iagahi"."City" VALUES (805, 17, 'خوزی');
INSERT INTO "iagahi"."City" VALUES (806, 17, 'گله دار');
INSERT INTO "iagahi"."City" VALUES (807, 17, 'مهر');
INSERT INTO "iagahi"."City" VALUES (808, 17, 'وراوی');
INSERT INTO "iagahi"."City" VALUES (809, 17, 'آباده طشک');
INSERT INTO "iagahi"."City" VALUES (810, 17, 'قطرویه');
INSERT INTO "iagahi"."City" VALUES (811, 17, 'مشکان');
INSERT INTO "iagahi"."City" VALUES (812, 17, 'نی ریز');
INSERT INTO "iagahi"."City" VALUES (813, 18, 'آبیک');
INSERT INTO "iagahi"."City" VALUES (814, 18, 'خاکعلی');
INSERT INTO "iagahi"."City" VALUES (815, 18, 'آبگرم');
INSERT INTO "iagahi"."City" VALUES (816, 18, 'آوج');
INSERT INTO "iagahi"."City" VALUES (817, 18, 'الوند');
INSERT INTO "iagahi"."City" VALUES (818, 18, 'بیدستان');
INSERT INTO "iagahi"."City" VALUES (819, 18, 'شریفیه');
INSERT INTO "iagahi"."City" VALUES (820, 18, 'محمدیه');
INSERT INTO "iagahi"."City" VALUES (821, 18, 'ارداق');
INSERT INTO "iagahi"."City" VALUES (822, 18, 'بویین زهرا');
INSERT INTO "iagahi"."City" VALUES (823, 18, 'دانسفهان');
INSERT INTO "iagahi"."City" VALUES (824, 18, 'سگزآباد');
INSERT INTO "iagahi"."City" VALUES (825, 18, 'شال');
INSERT INTO "iagahi"."City" VALUES (826, 18, 'اسفرورین');
INSERT INTO "iagahi"."City" VALUES (827, 18, 'تاکستان');
INSERT INTO "iagahi"."City" VALUES (828, 18, 'خرمدشت');
INSERT INTO "iagahi"."City" VALUES (829, 18, 'ضیاڈآباد');
INSERT INTO "iagahi"."City" VALUES (830, 18, 'نرجه');
INSERT INTO "iagahi"."City" VALUES (831, 18, 'اقبالیه');
INSERT INTO "iagahi"."City" VALUES (832, 18, 'رازمیان');
INSERT INTO "iagahi"."City" VALUES (833, 18, 'سیردان');
INSERT INTO "iagahi"."City" VALUES (834, 18, 'قزوین');
INSERT INTO "iagahi"."City" VALUES (835, 18, 'کوهین');
INSERT INTO "iagahi"."City" VALUES (836, 18, 'محمودآبادنمونه');
INSERT INTO "iagahi"."City" VALUES (837, 18, 'معلم کلایه');
INSERT INTO "iagahi"."City" VALUES (838, 19, 'جعفریه');
INSERT INTO "iagahi"."City" VALUES (839, 19, 'دستجرد');
INSERT INTO "iagahi"."City" VALUES (840, 19, 'سلفچگان');
INSERT INTO "iagahi"."City" VALUES (841, 19, 'قم');
INSERT INTO "iagahi"."City" VALUES (842, 19, 'قنوات');
INSERT INTO "iagahi"."City" VALUES (843, 19, 'کهک');
INSERT INTO "iagahi"."City" VALUES (844, 20, 'آرمرده');
INSERT INTO "iagahi"."City" VALUES (845, 20, 'بانه');
INSERT INTO "iagahi"."City" VALUES (846, 20, 'بویین سفلی');
INSERT INTO "iagahi"."City" VALUES (847, 20, 'کانی سور');
INSERT INTO "iagahi"."City" VALUES (848, 20, 'بابارشانی');
INSERT INTO "iagahi"."City" VALUES (849, 20, 'بیجار');
INSERT INTO "iagahi"."City" VALUES (850, 20, 'پیرتاج');
INSERT INTO "iagahi"."City" VALUES (851, 20, 'توپ آغاج');
INSERT INTO "iagahi"."City" VALUES (852, 20, 'یاسوکند');
INSERT INTO "iagahi"."City" VALUES (853, 20, 'بلبان آباد');
INSERT INTO "iagahi"."City" VALUES (854, 20, 'دهگلان');
INSERT INTO "iagahi"."City" VALUES (855, 20, 'دیواندره');
INSERT INTO "iagahi"."City" VALUES (856, 20, 'زرینه');
INSERT INTO "iagahi"."City" VALUES (857, 20, 'اورامان تخت');
INSERT INTO "iagahi"."City" VALUES (858, 20, 'سروآباد');
INSERT INTO "iagahi"."City" VALUES (859, 20, 'سقز');
INSERT INTO "iagahi"."City" VALUES (860, 20, 'صاحب');
INSERT INTO "iagahi"."City" VALUES (861, 20, 'سنندج');
INSERT INTO "iagahi"."City" VALUES (862, 20, 'شویشه');
INSERT INTO "iagahi"."City" VALUES (863, 20, 'دزج');
INSERT INTO "iagahi"."City" VALUES (864, 20, 'دلبران');
INSERT INTO "iagahi"."City" VALUES (865, 20, 'سریش آباد');
INSERT INTO "iagahi"."City" VALUES (866, 20, 'قروه');
INSERT INTO "iagahi"."City" VALUES (867, 20, 'کامیاران');
INSERT INTO "iagahi"."City" VALUES (868, 20, 'موچش');
INSERT INTO "iagahi"."City" VALUES (869, 20, 'برده رشه');
INSERT INTO "iagahi"."City" VALUES (870, 20, 'چناره');
INSERT INTO "iagahi"."City" VALUES (871, 20, 'کانی دینار');
INSERT INTO "iagahi"."City" VALUES (872, 20, 'مریوان');
INSERT INTO "iagahi"."City" VALUES (873, 21, 'ارزوییه');
INSERT INTO "iagahi"."City" VALUES (874, 21, 'امین شهر');
INSERT INTO "iagahi"."City" VALUES (875, 21, 'انار');
INSERT INTO "iagahi"."City" VALUES (876, 21, 'بافت');
INSERT INTO "iagahi"."City" VALUES (877, 21, 'بزنجان');
INSERT INTO "iagahi"."City" VALUES (878, 21, 'بردسیر');
INSERT INTO "iagahi"."City" VALUES (879, 21, 'دشتکار');
INSERT INTO "iagahi"."City" VALUES (880, 21, 'گلزار');
INSERT INTO "iagahi"."City" VALUES (881, 21, 'لاله زار');
INSERT INTO "iagahi"."City" VALUES (882, 21, 'نگار');
INSERT INTO "iagahi"."City" VALUES (883, 21, 'بروات');
INSERT INTO "iagahi"."City" VALUES (884, 21, 'بم');
INSERT INTO "iagahi"."City" VALUES (885, 21, 'بلوک');
INSERT INTO "iagahi"."City" VALUES (886, 21, 'جبالبارز');
INSERT INTO "iagahi"."City" VALUES (887, 21, 'جیرفت');
INSERT INTO "iagahi"."City" VALUES (888, 21, 'درب بهشت');
INSERT INTO "iagahi"."City" VALUES (889, 21, 'رابر');
INSERT INTO "iagahi"."City" VALUES (890, 21, 'هنزا');
INSERT INTO "iagahi"."City" VALUES (891, 21, 'راور');
INSERT INTO "iagahi"."City" VALUES (892, 21, 'هجدک');
INSERT INTO "iagahi"."City" VALUES (893, 21, 'بهرمان');
INSERT INTO "iagahi"."City" VALUES (894, 21, 'رفسنجان');
INSERT INTO "iagahi"."City" VALUES (895, 21, 'صفاییه');
INSERT INTO "iagahi"."City" VALUES (896, 21, 'کشکوییه');
INSERT INTO "iagahi"."City" VALUES (897, 21, 'مس سرچشمه');
INSERT INTO "iagahi"."City" VALUES (898, 21, 'رودبار');
INSERT INTO "iagahi"."City" VALUES (899, 21, 'زهکلوت');
INSERT INTO "iagahi"."City" VALUES (900, 21, 'گنبکی');
INSERT INTO "iagahi"."City" VALUES (901, 21, 'محمدآباد');
INSERT INTO "iagahi"."City" VALUES (902, 21, 'خانوک');
INSERT INTO "iagahi"."City" VALUES (903, 21, 'ریحان');
INSERT INTO "iagahi"."City" VALUES (904, 21, 'زرند');
INSERT INTO "iagahi"."City" VALUES (905, 21, 'یزدان شهر');
INSERT INTO "iagahi"."City" VALUES (906, 21, 'بلورد');
INSERT INTO "iagahi"."City" VALUES (907, 21, 'پاریز');
INSERT INTO "iagahi"."City" VALUES (908, 21, 'خواجو شهر');
INSERT INTO "iagahi"."City" VALUES (909, 21, 'زیدآباد');
INSERT INTO "iagahi"."City" VALUES (910, 21, 'سیرجان');
INSERT INTO "iagahi"."City" VALUES (911, 21, 'نجف شهر');
INSERT INTO "iagahi"."City" VALUES (912, 21, 'هماشهر');
INSERT INTO "iagahi"."City" VALUES (913, 21, 'جوزم');
INSERT INTO "iagahi"."City" VALUES (914, 21, 'خاتون اباد');
INSERT INTO "iagahi"."City" VALUES (915, 21, 'خورسند');
INSERT INTO "iagahi"."City" VALUES (916, 21, 'دهج');
INSERT INTO "iagahi"."City" VALUES (917, 21, 'شهربابک');
INSERT INTO "iagahi"."City" VALUES (918, 21, 'دوساری');
INSERT INTO "iagahi"."City" VALUES (919, 21, 'عنبرآباد');
INSERT INTO "iagahi"."City" VALUES (920, 21, 'مردهک');
INSERT INTO "iagahi"."City" VALUES (921, 21, 'فاریاب');
INSERT INTO "iagahi"."City" VALUES (922, 21, 'فهرج');
INSERT INTO "iagahi"."City" VALUES (923, 21, 'قلعه گنج');
INSERT INTO "iagahi"."City" VALUES (924, 21, 'اختیارآباد');
INSERT INTO "iagahi"."City" VALUES (925, 21, 'اندوهجرد');
INSERT INTO "iagahi"."City" VALUES (926, 21, 'باغین');
INSERT INTO "iagahi"."City" VALUES (927, 21, 'جوپار');
INSERT INTO "iagahi"."City" VALUES (928, 21, 'چترود');
INSERT INTO "iagahi"."City" VALUES (929, 21, 'راین');
INSERT INTO "iagahi"."City" VALUES (930, 21, 'زنگی آباد');
INSERT INTO "iagahi"."City" VALUES (931, 21, 'شهداد');
INSERT INTO "iagahi"."City" VALUES (932, 21, 'کاظم آباد');
INSERT INTO "iagahi"."City" VALUES (933, 21, 'کرمان');
INSERT INTO "iagahi"."City" VALUES (934, 21, 'گلباف');
INSERT INTO "iagahi"."City" VALUES (935, 21, 'ماهان');
INSERT INTO "iagahi"."City" VALUES (936, 21, 'محی آباد');
INSERT INTO "iagahi"."City" VALUES (937, 21, 'کوهبنان');
INSERT INTO "iagahi"."City" VALUES (938, 21, 'کیانشهر');
INSERT INTO "iagahi"."City" VALUES (939, 21, 'کهنوج');
INSERT INTO "iagahi"."City" VALUES (940, 21, 'منوجان');
INSERT INTO "iagahi"."City" VALUES (941, 21, 'نودژ');
INSERT INTO "iagahi"."City" VALUES (942, 21, 'نرماشیر');
INSERT INTO "iagahi"."City" VALUES (943, 21, 'نظام شهر');
INSERT INTO "iagahi"."City" VALUES (944, 22, 'اسلام آبادغرب');
INSERT INTO "iagahi"."City" VALUES (945, 22, 'حمیل');
INSERT INTO "iagahi"."City" VALUES (946, 22, 'بانوره');
INSERT INTO "iagahi"."City" VALUES (947, 22, 'باینگان');
INSERT INTO "iagahi"."City" VALUES (948, 22, 'پاوه');
INSERT INTO "iagahi"."City" VALUES (949, 22, 'نودشه');
INSERT INTO "iagahi"."City" VALUES (950, 22, 'نوسود');
INSERT INTO "iagahi"."City" VALUES (951, 22, 'ازگله');
INSERT INTO "iagahi"."City" VALUES (952, 22, 'تازه آباد');
INSERT INTO "iagahi"."City" VALUES (953, 22, 'جوانرود');
INSERT INTO "iagahi"."City" VALUES (954, 22, 'ریجاب');
INSERT INTO "iagahi"."City" VALUES (955, 22, 'کرند');
INSERT INTO "iagahi"."City" VALUES (956, 22, 'گهواره');
INSERT INTO "iagahi"."City" VALUES (957, 22, 'روانسر');
INSERT INTO "iagahi"."City" VALUES (958, 22, 'شاهو');
INSERT INTO "iagahi"."City" VALUES (959, 22, 'سرپل ذهاب');
INSERT INTO "iagahi"."City" VALUES (960, 22, 'سطر');
INSERT INTO "iagahi"."City" VALUES (961, 22, 'سنقر');
INSERT INTO "iagahi"."City" VALUES (962, 22, 'صحنه');
INSERT INTO "iagahi"."City" VALUES (963, 22, 'میان راهان');
INSERT INTO "iagahi"."City" VALUES (964, 22, 'سومار');
INSERT INTO "iagahi"."City" VALUES (965, 22, 'قصرشیرین');
INSERT INTO "iagahi"."City" VALUES (966, 22, 'رباط');
INSERT INTO "iagahi"."City" VALUES (967, 22, 'کرمانشاه');
INSERT INTO "iagahi"."City" VALUES (968, 22, 'کوزران');
INSERT INTO "iagahi"."City" VALUES (969, 22, 'هلشی');
INSERT INTO "iagahi"."City" VALUES (970, 22, 'کنگاور');
INSERT INTO "iagahi"."City" VALUES (971, 22, 'گودین');
INSERT INTO "iagahi"."City" VALUES (972, 22, 'سرمست');
INSERT INTO "iagahi"."City" VALUES (973, 22, 'گیلانغرب');
INSERT INTO "iagahi"."City" VALUES (974, 22, 'بیستون');
INSERT INTO "iagahi"."City" VALUES (975, 22, 'هرسین');
INSERT INTO "iagahi"."City" VALUES (976, 23, 'باشت');
INSERT INTO "iagahi"."City" VALUES (977, 23, 'چیتاب');
INSERT INTO "iagahi"."City" VALUES (978, 23, 'گراب سفلی');
INSERT INTO "iagahi"."City" VALUES (979, 23, 'مادوان');
INSERT INTO "iagahi"."City" VALUES (980, 23, 'مارگون');
INSERT INTO "iagahi"."City" VALUES (981, 23, 'یاسوج');
INSERT INTO "iagahi"."City" VALUES (982, 23, 'لیکک');
INSERT INTO "iagahi"."City" VALUES (983, 23, 'چرام');
INSERT INTO "iagahi"."City" VALUES (984, 23, 'سرفاریاب');
INSERT INTO "iagahi"."City" VALUES (985, 23, 'پاتاوه');
INSERT INTO "iagahi"."City" VALUES (986, 23, 'سی سخت');
INSERT INTO "iagahi"."City" VALUES (987, 23, 'دهدشت');
INSERT INTO "iagahi"."City" VALUES (988, 23, 'دیشموک');
INSERT INTO "iagahi"."City" VALUES (989, 23, 'سوق');
INSERT INTO "iagahi"."City" VALUES (990, 23, 'قلعه رییسی');
INSERT INTO "iagahi"."City" VALUES (991, 23, 'دوگنبدان');
INSERT INTO "iagahi"."City" VALUES (992, 23, 'لنده');
INSERT INTO "iagahi"."City" VALUES (993, 24, 'آزادشهر');
INSERT INTO "iagahi"."City" VALUES (994, 24, 'نگین شهر');
INSERT INTO "iagahi"."City" VALUES (995, 24, 'نوده خاندوز');
INSERT INTO "iagahi"."City" VALUES (996, 24, 'آق قلا');
INSERT INTO "iagahi"."City" VALUES (997, 24, 'انبارآلوم');
INSERT INTO "iagahi"."City" VALUES (998, 24, 'بندرگز');
INSERT INTO "iagahi"."City" VALUES (999, 24, 'نوکنده');
INSERT INTO "iagahi"."City" VALUES (1000, 24, 'بندرترکمن');
INSERT INTO "iagahi"."City" VALUES (1001, 24, 'تاتارعلیا');
INSERT INTO "iagahi"."City" VALUES (1002, 24, 'خان ببین');
INSERT INTO "iagahi"."City" VALUES (1003, 24, 'دلند');
INSERT INTO "iagahi"."City" VALUES (1004, 24, 'رامیان');
INSERT INTO "iagahi"."City" VALUES (1005, 24, 'سنگدوین');
INSERT INTO "iagahi"."City" VALUES (1006, 24, 'علی اباد');
INSERT INTO "iagahi"."City" VALUES (1007, 24, 'فاضل آباد');
INSERT INTO "iagahi"."City" VALUES (1008, 24, 'مزرعه');
INSERT INTO "iagahi"."City" VALUES (1009, 24, 'کردکوی');
INSERT INTO "iagahi"."City" VALUES (1010, 24, 'فراغی');
INSERT INTO "iagahi"."City" VALUES (1011, 24, 'کلاله');
INSERT INTO "iagahi"."City" VALUES (1012, 24, 'گالیکش');
INSERT INTO "iagahi"."City" VALUES (1013, 24, 'جلین');
INSERT INTO "iagahi"."City" VALUES (1014, 24, 'سرخنکلاته');
INSERT INTO "iagahi"."City" VALUES (1015, 24, 'گرگان');
INSERT INTO "iagahi"."City" VALUES (1016, 24, 'سیمین شهر');
INSERT INTO "iagahi"."City" VALUES (1017, 24, 'گمیش تپه');
INSERT INTO "iagahi"."City" VALUES (1018, 24, 'اینچه برون');
INSERT INTO "iagahi"."City" VALUES (1019, 24, 'گنبدکاووس');
INSERT INTO "iagahi"."City" VALUES (1020, 24, 'مراوه');
INSERT INTO "iagahi"."City" VALUES (1021, 24, 'مینودشت');
INSERT INTO "iagahi"."City" VALUES (1022, 25, 'آستارا');
INSERT INTO "iagahi"."City" VALUES (1023, 25, 'لوندویل');
INSERT INTO "iagahi"."City" VALUES (1024, 25, 'آستانه اشرفیه');
INSERT INTO "iagahi"."City" VALUES (1025, 25, 'کیاشهر');
INSERT INTO "iagahi"."City" VALUES (1026, 25, 'املش');
INSERT INTO "iagahi"."City" VALUES (1027, 25, 'رانکوه');
INSERT INTO "iagahi"."City" VALUES (1028, 25, 'بندرانزلی');
INSERT INTO "iagahi"."City" VALUES (1029, 25, 'خشکبیجار');
INSERT INTO "iagahi"."City" VALUES (1030, 25, 'خمام');
INSERT INTO "iagahi"."City" VALUES (1031, 25, 'رشت');
INSERT INTO "iagahi"."City" VALUES (1032, 25, 'سنگر');
INSERT INTO "iagahi"."City" VALUES (1033, 25, 'کوچصفهان');
INSERT INTO "iagahi"."City" VALUES (1034, 25, 'لشت نشاء');
INSERT INTO "iagahi"."City" VALUES (1035, 25, 'لولمان');
INSERT INTO "iagahi"."City" VALUES (1036, 25, 'پره سر');
INSERT INTO "iagahi"."City" VALUES (1037, 25, 'رضوانشهر');
INSERT INTO "iagahi"."City" VALUES (1038, 25, 'بره سر');
INSERT INTO "iagahi"."City" VALUES (1039, 25, 'توتکابن');
INSERT INTO "iagahi"."City" VALUES (1040, 25, 'جیرنده');
INSERT INTO "iagahi"."City" VALUES (1041, 25, 'رستم آباد');
INSERT INTO "iagahi"."City" VALUES (1042, 25, 'رودبار');
INSERT INTO "iagahi"."City" VALUES (1043, 25, 'لوشان');
INSERT INTO "iagahi"."City" VALUES (1044, 25, 'منجیل');
INSERT INTO "iagahi"."City" VALUES (1045, 25, 'چابکسر');
INSERT INTO "iagahi"."City" VALUES (1046, 25, 'رحیم آباد');
INSERT INTO "iagahi"."City" VALUES (1047, 25, 'رودسر');
INSERT INTO "iagahi"."City" VALUES (1048, 25, 'کلاچای');
INSERT INTO "iagahi"."City" VALUES (1049, 25, 'واجارگاه');
INSERT INTO "iagahi"."City" VALUES (1050, 25, 'دیلمان');
INSERT INTO "iagahi"."City" VALUES (1051, 25, 'سیاهکل');
INSERT INTO "iagahi"."City" VALUES (1052, 25, 'احمدسرگوراب');
INSERT INTO "iagahi"."City" VALUES (1053, 25, 'شفت');
INSERT INTO "iagahi"."City" VALUES (1054, 25, 'صومعه سرا');
INSERT INTO "iagahi"."City" VALUES (1055, 25, 'گوراب زرمیخ');
INSERT INTO "iagahi"."City" VALUES (1056, 25, 'مرجقل');
INSERT INTO "iagahi"."City" VALUES (1057, 25, 'اسالم');
INSERT INTO "iagahi"."City" VALUES (1058, 25, 'چوبر');
INSERT INTO "iagahi"."City" VALUES (1059, 25, 'حویق');
INSERT INTO "iagahi"."City" VALUES (1060, 25, 'لیسار');
INSERT INTO "iagahi"."City" VALUES (1061, 25, 'هشتپر (تالش)');
INSERT INTO "iagahi"."City" VALUES (1062, 25, 'فومن');
INSERT INTO "iagahi"."City" VALUES (1063, 25, 'ماسوله');
INSERT INTO "iagahi"."City" VALUES (1064, 25, 'ماکلوان');
INSERT INTO "iagahi"."City" VALUES (1065, 25, 'رودبنه');
INSERT INTO "iagahi"."City" VALUES (1066, 25, 'لاهیجان');
INSERT INTO "iagahi"."City" VALUES (1067, 25, 'اطاقور');
INSERT INTO "iagahi"."City" VALUES (1068, 25, 'چاف و چمخاله');
INSERT INTO "iagahi"."City" VALUES (1069, 25, 'شلمان');
INSERT INTO "iagahi"."City" VALUES (1070, 25, 'کومله');
INSERT INTO "iagahi"."City" VALUES (1071, 25, 'لنگرود');
INSERT INTO "iagahi"."City" VALUES (1072, 25, 'بازار جمعه');
INSERT INTO "iagahi"."City" VALUES (1073, 25, 'ماسال');
INSERT INTO "iagahi"."City" VALUES (1074, 26, 'ازنا');
INSERT INTO "iagahi"."City" VALUES (1075, 26, 'مومن آباد');
INSERT INTO "iagahi"."City" VALUES (1076, 26, 'الیگودرز');
INSERT INTO "iagahi"."City" VALUES (1077, 26, 'شول آباد');
INSERT INTO "iagahi"."City" VALUES (1078, 26, 'اشترینان');
INSERT INTO "iagahi"."City" VALUES (1079, 26, 'بروجرد');
INSERT INTO "iagahi"."City" VALUES (1080, 26, 'پلدختر');
INSERT INTO "iagahi"."City" VALUES (1081, 26, 'معمولان');
INSERT INTO "iagahi"."City" VALUES (1082, 26, 'بیران شهر');
INSERT INTO "iagahi"."City" VALUES (1083, 26, 'خرم آباد');
INSERT INTO "iagahi"."City" VALUES (1084, 26, 'زاغه');
INSERT INTO "iagahi"."City" VALUES (1085, 26, 'سپیددشت');
INSERT INTO "iagahi"."City" VALUES (1086, 26, 'نورآباد');
INSERT INTO "iagahi"."City" VALUES (1087, 26, 'هفت چشمه');
INSERT INTO "iagahi"."City" VALUES (1088, 26, 'چالانچولان');
INSERT INTO "iagahi"."City" VALUES (1089, 26, 'دورود');
INSERT INTO "iagahi"."City" VALUES (1090, 26, 'سراب دوره');
INSERT INTO "iagahi"."City" VALUES (1091, 26, 'ویسیان');
INSERT INTO "iagahi"."City" VALUES (1092, 26, 'چقابل');
INSERT INTO "iagahi"."City" VALUES (1093, 26, 'الشتر');
INSERT INTO "iagahi"."City" VALUES (1094, 26, 'فیروزآباد');
INSERT INTO "iagahi"."City" VALUES (1095, 26, 'درب گنبد');
INSERT INTO "iagahi"."City" VALUES (1096, 26, 'کوهدشت');
INSERT INTO "iagahi"."City" VALUES (1097, 26, 'کوهنانی');
INSERT INTO "iagahi"."City" VALUES (1098, 26, 'گراب');
INSERT INTO "iagahi"."City" VALUES (1099, 27, 'آمل');
INSERT INTO "iagahi"."City" VALUES (1100, 27, 'امامزاده عبدالله');
INSERT INTO "iagahi"."City" VALUES (1101, 27, 'دابودشت');
INSERT INTO "iagahi"."City" VALUES (1102, 27, 'رینه');
INSERT INTO "iagahi"."City" VALUES (1103, 27, 'گزنک');
INSERT INTO "iagahi"."City" VALUES (1104, 27, 'امیرکلا');
INSERT INTO "iagahi"."City" VALUES (1105, 27, 'بابل');
INSERT INTO "iagahi"."City" VALUES (1106, 27, 'خوش رودپی');
INSERT INTO "iagahi"."City" VALUES (1107, 27, 'زرگرمحله');
INSERT INTO "iagahi"."City" VALUES (1108, 27, 'گتاب');
INSERT INTO "iagahi"."City" VALUES (1109, 27, 'گلوگاه');
INSERT INTO "iagahi"."City" VALUES (1110, 27, 'مرزیکلا');
INSERT INTO "iagahi"."City" VALUES (1111, 27, 'بابلسر');
INSERT INTO "iagahi"."City" VALUES (1112, 27, 'بهنمیر');
INSERT INTO "iagahi"."City" VALUES (1113, 27, 'هادی شهر');
INSERT INTO "iagahi"."City" VALUES (1114, 27, 'بهشهر');
INSERT INTO "iagahi"."City" VALUES (1115, 27, 'خلیل شهر');
INSERT INTO "iagahi"."City" VALUES (1116, 27, 'رستمکلا');
INSERT INTO "iagahi"."City" VALUES (1117, 27, 'تنکابن');
INSERT INTO "iagahi"."City" VALUES (1118, 27, 'خرم آباد');
INSERT INTO "iagahi"."City" VALUES (1119, 27, 'شیرود');
INSERT INTO "iagahi"."City" VALUES (1120, 27, 'نشتارود');
INSERT INTO "iagahi"."City" VALUES (1121, 27, 'جویبار');
INSERT INTO "iagahi"."City" VALUES (1122, 27, 'کوهی خیل');
INSERT INTO "iagahi"."City" VALUES (1123, 27, 'چالوس');
INSERT INTO "iagahi"."City" VALUES (1124, 27, 'مرزن آباد');
INSERT INTO "iagahi"."City" VALUES (1125, 27, 'هچیرود');
INSERT INTO "iagahi"."City" VALUES (1126, 27, 'رامسر');
INSERT INTO "iagahi"."City" VALUES (1127, 27, 'کتالم وسادات شهر');
INSERT INTO "iagahi"."City" VALUES (1128, 27, 'پایین هولار');
INSERT INTO "iagahi"."City" VALUES (1129, 27, 'ساری');
INSERT INTO "iagahi"."City" VALUES (1130, 27, 'فریم');
INSERT INTO "iagahi"."City" VALUES (1131, 27, 'کیاسر');
INSERT INTO "iagahi"."City" VALUES (1132, 27, 'آلاشت');
INSERT INTO "iagahi"."City" VALUES (1133, 27, 'پل سفید');
INSERT INTO "iagahi"."City" VALUES (1134, 27, 'زیرآب');
INSERT INTO "iagahi"."City" VALUES (1135, 27, 'شیرگاه');
INSERT INTO "iagahi"."City" VALUES (1136, 27, 'کیاکلا');
INSERT INTO "iagahi"."City" VALUES (1137, 27, 'سلمان شهر');
INSERT INTO "iagahi"."City" VALUES (1138, 27, 'عباس اباد');
INSERT INTO "iagahi"."City" VALUES (1139, 27, 'کلارآباد');
INSERT INTO "iagahi"."City" VALUES (1140, 27, 'فریدونکنار');
INSERT INTO "iagahi"."City" VALUES (1141, 27, 'ارطه');
INSERT INTO "iagahi"."City" VALUES (1142, 27, 'قایم شهر');
INSERT INTO "iagahi"."City" VALUES (1143, 27, 'کلاردشت');
INSERT INTO "iagahi"."City" VALUES (1144, 27, 'گلوگاه');
INSERT INTO "iagahi"."City" VALUES (1145, 27, 'سرخرود');
INSERT INTO "iagahi"."City" VALUES (1146, 27, 'محمودآباد');
INSERT INTO "iagahi"."City" VALUES (1147, 27, 'سورک');
INSERT INTO "iagahi"."City" VALUES (1148, 27, 'نکا');
INSERT INTO "iagahi"."City" VALUES (1149, 27, 'ایزدشهر');
INSERT INTO "iagahi"."City" VALUES (1150, 27, 'بلده');
INSERT INTO "iagahi"."City" VALUES (1151, 27, 'چمستان');
INSERT INTO "iagahi"."City" VALUES (1152, 27, 'رویان');
INSERT INTO "iagahi"."City" VALUES (1153, 27, 'نور');
INSERT INTO "iagahi"."City" VALUES (1154, 27, 'پول');
INSERT INTO "iagahi"."City" VALUES (1155, 27, 'کجور');
INSERT INTO "iagahi"."City" VALUES (1156, 27, 'نوشهر');
INSERT INTO "iagahi"."City" VALUES (1157, 28, 'آشتیان');
INSERT INTO "iagahi"."City" VALUES (1158, 28, 'اراک');
INSERT INTO "iagahi"."City" VALUES (1159, 28, 'داودآباد');
INSERT INTO "iagahi"."City" VALUES (1160, 28, 'ساروق');
INSERT INTO "iagahi"."City" VALUES (1161, 28, 'کارچان');
INSERT INTO "iagahi"."City" VALUES (1162, 28, 'تفرش');
INSERT INTO "iagahi"."City" VALUES (1163, 28, 'خمین');
INSERT INTO "iagahi"."City" VALUES (1164, 28, 'قورچی باشی');
INSERT INTO "iagahi"."City" VALUES (1165, 28, 'جاورسیان');
INSERT INTO "iagahi"."City" VALUES (1166, 28, 'خنداب');
INSERT INTO "iagahi"."City" VALUES (1167, 28, 'دلیجان');
INSERT INTO "iagahi"."City" VALUES (1168, 28, 'نراق');
INSERT INTO "iagahi"."City" VALUES (1169, 28, 'پرندک');
INSERT INTO "iagahi"."City" VALUES (1170, 28, 'خشکرود');
INSERT INTO "iagahi"."City" VALUES (1171, 28, 'رازقان');
INSERT INTO "iagahi"."City" VALUES (1172, 28, 'زاویه');
INSERT INTO "iagahi"."City" VALUES (1173, 28, 'مامونیه');
INSERT INTO "iagahi"."City" VALUES (1174, 28, 'آوه');
INSERT INTO "iagahi"."City" VALUES (1175, 28, 'ساوه');
INSERT INTO "iagahi"."City" VALUES (1176, 28, 'غرق آباد');
INSERT INTO "iagahi"."City" VALUES (1177, 28, 'نوبران');
INSERT INTO "iagahi"."City" VALUES (1178, 28, 'آستانه');
INSERT INTO "iagahi"."City" VALUES (1179, 28, 'توره');
INSERT INTO "iagahi"."City" VALUES (1180, 28, 'شازند');
INSERT INTO "iagahi"."City" VALUES (1181, 28, 'شهباز');
INSERT INTO "iagahi"."City" VALUES (1182, 28, 'مهاجران');
INSERT INTO "iagahi"."City" VALUES (1183, 28, 'هندودر');
INSERT INTO "iagahi"."City" VALUES (1184, 28, 'خنجین');
INSERT INTO "iagahi"."City" VALUES (1185, 28, 'فرمهین');
INSERT INTO "iagahi"."City" VALUES (1186, 28, 'کمیجان');
INSERT INTO "iagahi"."City" VALUES (1187, 28, 'میلاجرد');
INSERT INTO "iagahi"."City" VALUES (1188, 28, 'محلات');
INSERT INTO "iagahi"."City" VALUES (1189, 28, 'نیمور');
INSERT INTO "iagahi"."City" VALUES (1190, 29, 'ابوموسی');
INSERT INTO "iagahi"."City" VALUES (1191, 29, 'بستک');
INSERT INTO "iagahi"."City" VALUES (1192, 29, 'جناح');
INSERT INTO "iagahi"."City" VALUES (1193, 29, 'سردشت');
INSERT INTO "iagahi"."City" VALUES (1194, 29, 'گوهران');
INSERT INTO "iagahi"."City" VALUES (1195, 29, 'بندرعباس');
INSERT INTO "iagahi"."City" VALUES (1196, 29, 'تازیان پایین');
INSERT INTO "iagahi"."City" VALUES (1197, 29, 'تخت');
INSERT INTO "iagahi"."City" VALUES (1198, 29, 'فین');
INSERT INTO "iagahi"."City" VALUES (1199, 29, 'قلعه قاضی');
INSERT INTO "iagahi"."City" VALUES (1200, 29, 'بندرلنگه');
INSERT INTO "iagahi"."City" VALUES (1201, 29, 'چارک');
INSERT INTO "iagahi"."City" VALUES (1202, 29, 'کنگ');
INSERT INTO "iagahi"."City" VALUES (1203, 29, 'کیش');
INSERT INTO "iagahi"."City" VALUES (1204, 29, 'لمزان');
INSERT INTO "iagahi"."City" VALUES (1205, 29, 'پارسیان');
INSERT INTO "iagahi"."City" VALUES (1206, 29, 'دشتی');
INSERT INTO "iagahi"."City" VALUES (1207, 29, 'کوشکنار');
INSERT INTO "iagahi"."City" VALUES (1208, 29, 'بندرجاسک');
INSERT INTO "iagahi"."City" VALUES (1209, 29, 'حاجی اباد');
INSERT INTO "iagahi"."City" VALUES (1210, 29, 'سرگز');
INSERT INTO "iagahi"."City" VALUES (1211, 29, 'فارغان');
INSERT INTO "iagahi"."City" VALUES (1212, 29, 'خمیر');
INSERT INTO "iagahi"."City" VALUES (1213, 29, 'رویدر');
INSERT INTO "iagahi"."City" VALUES (1214, 29, 'بیکاء');
INSERT INTO "iagahi"."City" VALUES (1215, 29, 'دهبارز');
INSERT INTO "iagahi"."City" VALUES (1216, 29, 'زیارتعلی');
INSERT INTO "iagahi"."City" VALUES (1217, 29, 'سیریک');
INSERT INTO "iagahi"."City" VALUES (1218, 29, 'کوهستک');
INSERT INTO "iagahi"."City" VALUES (1219, 29, 'گروک');
INSERT INTO "iagahi"."City" VALUES (1220, 29, 'درگهان');
INSERT INTO "iagahi"."City" VALUES (1221, 29, 'سوزا');
INSERT INTO "iagahi"."City" VALUES (1222, 29, 'قشم');
INSERT INTO "iagahi"."City" VALUES (1223, 29, 'هرمز');
INSERT INTO "iagahi"."City" VALUES (1224, 29, 'تیرور');
INSERT INTO "iagahi"."City" VALUES (1225, 29, 'سندرک');
INSERT INTO "iagahi"."City" VALUES (1226, 29, 'میناب');
INSERT INTO "iagahi"."City" VALUES (1227, 29, 'هشتبندی');
INSERT INTO "iagahi"."City" VALUES (1228, 30, 'آجین');
INSERT INTO "iagahi"."City" VALUES (1229, 30, 'اسدآباد');
INSERT INTO "iagahi"."City" VALUES (1230, 30, 'بهار');
INSERT INTO "iagahi"."City" VALUES (1231, 30, 'صالح آباد');
INSERT INTO "iagahi"."City" VALUES (1232, 30, 'لالجین');
INSERT INTO "iagahi"."City" VALUES (1233, 30, 'مهاجران');
INSERT INTO "iagahi"."City" VALUES (1234, 30, 'تویسرکان');
INSERT INTO "iagahi"."City" VALUES (1235, 30, 'سرکان');
INSERT INTO "iagahi"."City" VALUES (1236, 30, 'فرسفج');
INSERT INTO "iagahi"."City" VALUES (1237, 30, 'دمق');
INSERT INTO "iagahi"."City" VALUES (1238, 30, 'رزن');
INSERT INTO "iagahi"."City" VALUES (1239, 30, 'قروه درجزین');
INSERT INTO "iagahi"."City" VALUES (1240, 30, 'فامنین');
INSERT INTO "iagahi"."City" VALUES (1241, 30, 'شیرین سو');
INSERT INTO "iagahi"."City" VALUES (1242, 30, 'کبودرآهنگ');
INSERT INTO "iagahi"."City" VALUES (1243, 30, 'گل تپه');
INSERT INTO "iagahi"."City" VALUES (1244, 30, 'ازندریان');
INSERT INTO "iagahi"."City" VALUES (1245, 30, 'جوکار');
INSERT INTO "iagahi"."City" VALUES (1246, 30, 'زنگنه');
INSERT INTO "iagahi"."City" VALUES (1247, 30, 'سامن');
INSERT INTO "iagahi"."City" VALUES (1248, 30, 'ملایر');
INSERT INTO "iagahi"."City" VALUES (1249, 30, 'برزول');
INSERT INTO "iagahi"."City" VALUES (1250, 30, 'فیروزان');
INSERT INTO "iagahi"."City" VALUES (1251, 30, 'گیان');
INSERT INTO "iagahi"."City" VALUES (1252, 30, 'نهاوند');
INSERT INTO "iagahi"."City" VALUES (1253, 30, 'جورقان');
INSERT INTO "iagahi"."City" VALUES (1254, 30, 'قهاوند');
INSERT INTO "iagahi"."City" VALUES (1255, 30, 'مریانج');
INSERT INTO "iagahi"."City" VALUES (1256, 30, 'همدان');
INSERT INTO "iagahi"."City" VALUES (1257, 18, 'خوزنين');
INSERT INTO "iagahi"."City" VALUES (1258, 31, 'ابرکوه');
INSERT INTO "iagahi"."City" VALUES (1259, 31, 'مهردشت');
INSERT INTO "iagahi"."City" VALUES (1260, 31, 'احمدآباد');
INSERT INTO "iagahi"."City" VALUES (1261, 31, 'اردکان');
INSERT INTO "iagahi"."City" VALUES (1262, 31, 'عقدا');
INSERT INTO "iagahi"."City" VALUES (1263, 31, 'اشکذر');
INSERT INTO "iagahi"."City" VALUES (1264, 31, 'خضرآباد');
INSERT INTO "iagahi"."City" VALUES (1265, 31, 'بافق');
INSERT INTO "iagahi"."City" VALUES (1266, 31, 'بهاباد');
INSERT INTO "iagahi"."City" VALUES (1267, 31, 'تفت');
INSERT INTO "iagahi"."City" VALUES (1268, 31, 'نیر');
INSERT INTO "iagahi"."City" VALUES (1269, 31, 'مروست');
INSERT INTO "iagahi"."City" VALUES (1270, 31, 'هرات');
INSERT INTO "iagahi"."City" VALUES (1271, 31, 'مهریز');
INSERT INTO "iagahi"."City" VALUES (1272, 31, 'بفروییه');
INSERT INTO "iagahi"."City" VALUES (1273, 31, 'میبد');
INSERT INTO "iagahi"."City" VALUES (1274, 31, 'ندوشن');
INSERT INTO "iagahi"."City" VALUES (1275, 31, 'حمیدیا');
INSERT INTO "iagahi"."City" VALUES (1276, 31, 'زارچ');
INSERT INTO "iagahi"."City" VALUES (1277, 31, 'شاهدیه');
INSERT INTO "iagahi"."City" VALUES (1278, 31, 'یزد');

-- ----------------------------
-- Table structure for Image
-- ----------------------------
DROP TABLE IF EXISTS "iagahi"."Image";
CREATE TABLE "iagahi"."Image" (
  "image_id" int8 NOT NULL DEFAULT nextval('"iagahi"."Image_image_id_seq"'::regclass),
  "url" text COLLATE "pg_catalog"."default" NOT NULL,
  "ad_id" int8
)
;


-- ----------------------------
-- Table structure for Message
-- ----------------------------
DROP TABLE IF EXISTS "iagahi"."Message";
CREATE TABLE "iagahi"."Message" (
  "mid" int8 NOT NULL DEFAULT nextval('"iagahi".message_mid_seq'::regclass),
  "message_body" text COLLATE "pg_catalog"."default" NOT NULL,
  "creator_id" int4 NOT NULL,
  "recipient_id" int4 NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "is_read" bool NOT NULL DEFAULT false
)
;


-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS "iagahi"."User";
CREATE TABLE "iagahi"."User" (
  "uid" int4 NOT NULL DEFAULT nextval('"iagahi".user_uid_seq'::regclass),
  "fullname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "is_active" bool NOT NULL DEFAULT false,
  "city" int4,
  "phone_number" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Primary Key structure for table Ad
-- ----------------------------
ALTER TABLE "iagahi"."Ad" ADD CONSTRAINT "Ad_pkey" PRIMARY KEY ("ad_id");

-- ----------------------------
-- Primary Key structure for table Bookmark
-- ----------------------------
ALTER TABLE "iagahi"."Bookmark" ADD CONSTRAINT "Bookmark_pkey" PRIMARY KEY ("uid", "ad_id");

-- ----------------------------
-- Primary Key structure for table Category
-- ----------------------------
ALTER TABLE "iagahi"."Category" ADD CONSTRAINT "Category_pkey" PRIMARY KEY ("cat_id");

-- ----------------------------
-- Primary Key structure for table City
-- ----------------------------
ALTER TABLE "iagahi"."City" ADD CONSTRAINT "City_pkey" PRIMARY KEY ("city_id");

-- ----------------------------
-- Primary Key structure for table Image
-- ----------------------------
ALTER TABLE "iagahi"."Image" ADD CONSTRAINT "Image_pkey" PRIMARY KEY ("image_id");

-- ----------------------------
-- Primary Key structure for table Message
-- ----------------------------
ALTER TABLE "iagahi"."Message" ADD CONSTRAINT "message_pkey" PRIMARY KEY ("mid");

-- ----------------------------
-- Uniques structure for table User
-- ----------------------------
ALTER TABLE "iagahi"."User" ADD CONSTRAINT "u_email" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE "iagahi"."User" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("uid");

-- ----------------------------
-- Foreign Keys structure for table Ad
-- ----------------------------
ALTER TABLE "iagahi"."Ad" ADD CONSTRAINT "category_fk" FOREIGN KEY ("category") REFERENCES "iagahi"."Category" ("cat_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "iagahi"."Ad" ADD CONSTRAINT "city_fk" FOREIGN KEY ("city") REFERENCES "iagahi"."City" ("city_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "iagahi"."Ad" ADD CONSTRAINT "creator_fk" FOREIGN KEY ("creator") REFERENCES "iagahi"."User" ("uid") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "iagahi"."Ad" ADD CONSTRAINT "main_image_fk" FOREIGN KEY ("main_image_id") REFERENCES "iagahi"."Image" ("image_id") ON DELETE SET NULL ON UPDATE SET NULL;

-- ----------------------------
-- Foreign Keys structure for table Bookmark
-- ----------------------------
ALTER TABLE "iagahi"."Bookmark" ADD CONSTRAINT "ad_id_fk" FOREIGN KEY ("ad_id") REFERENCES "iagahi"."Ad" ("ad_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "iagahi"."Bookmark" ADD CONSTRAINT "uid_fk" FOREIGN KEY ("uid") REFERENCES "iagahi"."User" ("uid") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Category
-- ----------------------------
ALTER TABLE "iagahi"."Category" ADD CONSTRAINT "parent_fk" FOREIGN KEY ("parent_id") REFERENCES "iagahi"."Category" ("cat_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table City
-- ----------------------------
ALTER TABLE "iagahi"."City" ADD CONSTRAINT "sub_fk" FOREIGN KEY ("sub") REFERENCES "iagahi"."City" ("city_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Image
-- ----------------------------
ALTER TABLE "iagahi"."Image" ADD CONSTRAINT "ad_id_fk" FOREIGN KEY ("ad_id") REFERENCES "iagahi"."Ad" ("ad_id") ON DELETE SET NULL ON UPDATE SET NULL;

-- ----------------------------
-- Foreign Keys structure for table Message
-- ----------------------------
ALTER TABLE "iagahi"."Message" ADD CONSTRAINT "creator_fk" FOREIGN KEY ("creator_id") REFERENCES "iagahi"."User" ("uid") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "iagahi"."Message" ADD CONSTRAINT "recipient_fk" FOREIGN KEY ("recipient_id") REFERENCES "iagahi"."User" ("uid") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table User
-- ----------------------------
ALTER TABLE "iagahi"."User" ADD CONSTRAINT "city_fk" FOREIGN KEY ("city") REFERENCES "iagahi"."City" ("city_id") ON DELETE SET NULL ON UPDATE SET NULL;
