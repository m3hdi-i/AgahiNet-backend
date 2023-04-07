
CREATE SCHEMA IF NOT EXISTS agahinet;

-- ----------------------------
-- Sequence structure for Ad_ad_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "agahinet"."Ad_ad_id_seq";
CREATE SEQUENCE "agahinet"."Ad_ad_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Category_cat_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "agahinet"."Category_cat_id_seq";
CREATE SEQUENCE "agahinet"."Category_cat_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for City_city_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "agahinet"."City_city_id_seq";
CREATE SEQUENCE "agahinet"."City_city_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for Image_image_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "agahinet"."Image_image_id_seq";
CREATE SEQUENCE "agahinet"."Image_image_id_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for message_mid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "agahinet"."message_mid_seq";
CREATE SEQUENCE "agahinet"."message_mid_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_uid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "agahinet"."user_uid_seq";
CREATE SEQUENCE "agahinet"."user_uid_seq"
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for Ad
-- ----------------------------
DROP TABLE IF EXISTS "agahinet"."Ad";
CREATE TABLE "agahinet"."Ad" (
  "ad_id" int8 NOT NULL DEFAULT nextval('"agahinet"."Ad_ad_id_seq"'::regclass),
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
DROP TABLE IF EXISTS "agahinet"."Bookmark";
CREATE TABLE "agahinet"."Bookmark" (
  "uid" int8 NOT NULL,
  "ad_id" int8 NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now()
)
;

-- ----------------------------
-- Table structure for Category
-- ----------------------------
DROP TABLE IF EXISTS "agahinet"."Category";
CREATE TABLE "agahinet"."Category" (
  "cat_id" int4 NOT NULL DEFAULT nextval('"agahinet"."Category_cat_id_seq"'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int4
)
;

-- ----------------------------
-- Records of Category
-- ----------------------------
INSERT INTO "agahinet"."Category" VALUES (1, 'املاک', NULL);
INSERT INTO "agahinet"."Category" VALUES (2, 'وسایل نقلیه', NULL);
INSERT INTO "agahinet"."Category" VALUES (3, 'کالای دیجیتال', NULL);
INSERT INTO "agahinet"."Category" VALUES (4, 'خانه و آشپزخانه', NULL);
INSERT INTO "agahinet"."Category" VALUES (5, 'خدمات', NULL);
INSERT INTO "agahinet"."Category" VALUES (6, 'وسایل شخصی', NULL);
INSERT INTO "agahinet"."Category" VALUES (7, 'سرگرمی و فراغت', NULL);
INSERT INTO "agahinet"."Category" VALUES (8, 'تجهیزات و صنعتی', NULL);
INSERT INTO "agahinet"."Category" VALUES (9, 'استخدام و کاریابی', NULL);
INSERT INTO "agahinet"."Category" VALUES (10, 'اجتماعی', NULL);
INSERT INTO "agahinet"."Category" VALUES (11, 'سایر دسته‌ها', NULL);


-- ----------------------------
-- Table structure for City
-- ----------------------------
DROP TABLE IF EXISTS "agahinet"."City";
CREATE TABLE "agahinet"."City" (
  "city_id" int4 NOT NULL DEFAULT nextval('"agahinet"."City_city_id_seq"'::regclass),
  "sub" int4,
  "title" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of City
-- ----------------------------
INSERT INTO "agahinet"."City" VALUES (1, NULL, 'آذربایجان شرقی');
INSERT INTO "agahinet"."City" VALUES (2, NULL, 'آذربایجان غربی');
INSERT INTO "agahinet"."City" VALUES (3, NULL, 'اردبیل');
INSERT INTO "agahinet"."City" VALUES (4, NULL, 'اصفهان');
INSERT INTO "agahinet"."City" VALUES (5, NULL, 'البرز');
INSERT INTO "agahinet"."City" VALUES (6, NULL, 'ایلام');
INSERT INTO "agahinet"."City" VALUES (7, NULL, 'بوشهر');
INSERT INTO "agahinet"."City" VALUES (8, NULL, 'تهران');
INSERT INTO "agahinet"."City" VALUES (9, NULL, 'چهارمحال وبختیاری');
INSERT INTO "agahinet"."City" VALUES (10, NULL, 'خراسان جنوبی');
INSERT INTO "agahinet"."City" VALUES (11, NULL, 'خراسان رضوی');
INSERT INTO "agahinet"."City" VALUES (12, NULL, 'خراسان شمالی');
INSERT INTO "agahinet"."City" VALUES (13, NULL, 'خوزستان');
INSERT INTO "agahinet"."City" VALUES (14, NULL, 'زنجان');
INSERT INTO "agahinet"."City" VALUES (15, NULL, 'سمنان');
INSERT INTO "agahinet"."City" VALUES (16, NULL, 'سیستان وبلوچستان');
INSERT INTO "agahinet"."City" VALUES (17, NULL, 'فارس');
INSERT INTO "agahinet"."City" VALUES (18, NULL, 'قزوین');
INSERT INTO "agahinet"."City" VALUES (19, NULL, 'قم');
INSERT INTO "agahinet"."City" VALUES (20, NULL, 'کردستان');
INSERT INTO "agahinet"."City" VALUES (21, NULL, 'کرمان');
INSERT INTO "agahinet"."City" VALUES (22, NULL, 'کرمانشاه');
INSERT INTO "agahinet"."City" VALUES (23, NULL, 'کهگیلویه وبویراحمد');
INSERT INTO "agahinet"."City" VALUES (24, NULL, 'گلستان');
INSERT INTO "agahinet"."City" VALUES (25, NULL, 'گیلان');
INSERT INTO "agahinet"."City" VALUES (26, NULL, 'لرستان');
INSERT INTO "agahinet"."City" VALUES (27, NULL, 'مازندران');
INSERT INTO "agahinet"."City" VALUES (28, NULL, 'مرکزی');
INSERT INTO "agahinet"."City" VALUES (29, NULL, 'هرمزگان');
INSERT INTO "agahinet"."City" VALUES (30, NULL, 'همدان');
INSERT INTO "agahinet"."City" VALUES (31, NULL, 'یزد');
INSERT INTO "agahinet"."City" VALUES (32, 1, 'آذرشهر');
INSERT INTO "agahinet"."City" VALUES (33, 1, 'تیمورلو');
INSERT INTO "agahinet"."City" VALUES (34, 1, 'گوگان');
INSERT INTO "agahinet"."City" VALUES (35, 1, 'ممقان');
INSERT INTO "agahinet"."City" VALUES (36, 1, 'اسکو');
INSERT INTO "agahinet"."City" VALUES (37, 1, 'ایلخچی');
INSERT INTO "agahinet"."City" VALUES (38, 1, 'سهند');
INSERT INTO "agahinet"."City" VALUES (39, 1, 'اهر');
INSERT INTO "agahinet"."City" VALUES (40, 1, 'هوراند');
INSERT INTO "agahinet"."City" VALUES (41, 1, 'بستان آباد');
INSERT INTO "agahinet"."City" VALUES (42, 1, 'تیکمه داش');
INSERT INTO "agahinet"."City" VALUES (43, 1, 'بناب');
INSERT INTO "agahinet"."City" VALUES (44, 1, 'باسمنج');
INSERT INTO "agahinet"."City" VALUES (45, 1, 'تبریز');
INSERT INTO "agahinet"."City" VALUES (46, 1, 'خسروشاه');
INSERT INTO "agahinet"."City" VALUES (47, 1, 'سردرود');
INSERT INTO "agahinet"."City" VALUES (48, 1, 'جلفا');
INSERT INTO "agahinet"."City" VALUES (49, 1, 'سیه رود');
INSERT INTO "agahinet"."City" VALUES (50, 1, 'هادیشهر');
INSERT INTO "agahinet"."City" VALUES (51, 1, 'قره آغاج');
INSERT INTO "agahinet"."City" VALUES (52, 1, 'خمارلو');
INSERT INTO "agahinet"."City" VALUES (53, 1, 'دوزدوزان');
INSERT INTO "agahinet"."City" VALUES (54, 1, 'سراب');
INSERT INTO "agahinet"."City" VALUES (55, 1, 'شربیان');
INSERT INTO "agahinet"."City" VALUES (56, 1, 'مهربان');
INSERT INTO "agahinet"."City" VALUES (57, 1, 'تسوج');
INSERT INTO "agahinet"."City" VALUES (58, 1, 'خامنه');
INSERT INTO "agahinet"."City" VALUES (59, 1, 'سیس');
INSERT INTO "agahinet"."City" VALUES (60, 1, 'شبستر');
INSERT INTO "agahinet"."City" VALUES (61, 1, 'شرفخانه');
INSERT INTO "agahinet"."City" VALUES (62, 1, 'شندآباد');
INSERT INTO "agahinet"."City" VALUES (63, 1, 'صوفیان');
INSERT INTO "agahinet"."City" VALUES (64, 1, 'کوزه کنان');
INSERT INTO "agahinet"."City" VALUES (65, 1, 'وایقان');
INSERT INTO "agahinet"."City" VALUES (66, 1, 'جوان قلعه');
INSERT INTO "agahinet"."City" VALUES (67, 1, 'عجب شیر');
INSERT INTO "agahinet"."City" VALUES (68, 1, 'آبش احمد');
INSERT INTO "agahinet"."City" VALUES (69, 1, 'کلیبر');
INSERT INTO "agahinet"."City" VALUES (70, 1, 'خداجو(خراجو)');
INSERT INTO "agahinet"."City" VALUES (71, 1, 'مراغه');
INSERT INTO "agahinet"."City" VALUES (72, 1, 'بناب مرند');
INSERT INTO "agahinet"."City" VALUES (73, 1, 'زنوز');
INSERT INTO "agahinet"."City" VALUES (74, 1, 'کشکسرای');
INSERT INTO "agahinet"."City" VALUES (75, 1, 'مرند');
INSERT INTO "agahinet"."City" VALUES (76, 1, 'یامچی');
INSERT INTO "agahinet"."City" VALUES (77, 1, 'لیلان');
INSERT INTO "agahinet"."City" VALUES (78, 1, 'مبارک شهر');
INSERT INTO "agahinet"."City" VALUES (79, 1, 'ملکان');
INSERT INTO "agahinet"."City" VALUES (80, 1, 'آقکند');
INSERT INTO "agahinet"."City" VALUES (81, 1, 'اچاچی');
INSERT INTO "agahinet"."City" VALUES (82, 1, 'ترک');
INSERT INTO "agahinet"."City" VALUES (83, 1, 'ترکمانچای');
INSERT INTO "agahinet"."City" VALUES (84, 1, 'میانه');
INSERT INTO "agahinet"."City" VALUES (85, 1, 'خاروانا');
INSERT INTO "agahinet"."City" VALUES (86, 1, 'ورزقان');
INSERT INTO "agahinet"."City" VALUES (87, 1, 'بخشایش');
INSERT INTO "agahinet"."City" VALUES (88, 1, 'خواجه');
INSERT INTO "agahinet"."City" VALUES (89, 1, 'زرنق');
INSERT INTO "agahinet"."City" VALUES (90, 1, 'کلوانق');
INSERT INTO "agahinet"."City" VALUES (91, 1, 'هریس');
INSERT INTO "agahinet"."City" VALUES (92, 1, 'نظرکهریزی');
INSERT INTO "agahinet"."City" VALUES (93, 1, 'هشترود');
INSERT INTO "agahinet"."City" VALUES (94, 2, 'ارومیه');
INSERT INTO "agahinet"."City" VALUES (95, 2, 'سرو');
INSERT INTO "agahinet"."City" VALUES (96, 2, 'سیلوانه');
INSERT INTO "agahinet"."City" VALUES (97, 2, 'قوشچی');
INSERT INTO "agahinet"."City" VALUES (98, 2, 'نوشین');
INSERT INTO "agahinet"."City" VALUES (99, 2, 'اشنویه');
INSERT INTO "agahinet"."City" VALUES (100, 2, 'نالوس');
INSERT INTO "agahinet"."City" VALUES (101, 2, 'بوکان');
INSERT INTO "agahinet"."City" VALUES (102, 2, 'سیمینه');
INSERT INTO "agahinet"."City" VALUES (103, 2, 'پلدشت');
INSERT INTO "agahinet"."City" VALUES (104, 2, 'نازک علیا');
INSERT INTO "agahinet"."City" VALUES (105, 2, 'پیرانشهر');
INSERT INTO "agahinet"."City" VALUES (106, 2, 'گردکشانه');
INSERT INTO "agahinet"."City" VALUES (107, 2, 'تکاب');
INSERT INTO "agahinet"."City" VALUES (108, 2, 'آواجیق');
INSERT INTO "agahinet"."City" VALUES (109, 2, 'سیه چشمه');
INSERT INTO "agahinet"."City" VALUES (110, 2, 'قره ضیاءالدین');
INSERT INTO "agahinet"."City" VALUES (111, 2, 'ایواوغلی');
INSERT INTO "agahinet"."City" VALUES (112, 2, 'خوی');
INSERT INTO "agahinet"."City" VALUES (113, 2, 'دیزج دیز');
INSERT INTO "agahinet"."City" VALUES (114, 2, 'زرآباد');
INSERT INTO "agahinet"."City" VALUES (115, 2, 'فیرورق');
INSERT INTO "agahinet"."City" VALUES (116, 2, 'قطور');
INSERT INTO "agahinet"."City" VALUES (117, 2, 'ربط');
INSERT INTO "agahinet"."City" VALUES (118, 2, 'سردشت');
INSERT INTO "agahinet"."City" VALUES (119, 2, 'میرآباد');
INSERT INTO "agahinet"."City" VALUES (120, 2, 'تازه شهر');
INSERT INTO "agahinet"."City" VALUES (121, 2, 'سلماس');
INSERT INTO "agahinet"."City" VALUES (122, 2, 'شاهین دژ');
INSERT INTO "agahinet"."City" VALUES (123, 2, 'کشاورز');
INSERT INTO "agahinet"."City" VALUES (124, 2, 'محمودآباد');
INSERT INTO "agahinet"."City" VALUES (125, 2, 'شوط');
INSERT INTO "agahinet"."City" VALUES (126, 2, 'مرگنلر');
INSERT INTO "agahinet"."City" VALUES (127, 2, 'بازرگان');
INSERT INTO "agahinet"."City" VALUES (128, 2, 'ماکو');
INSERT INTO "agahinet"."City" VALUES (129, 2, 'خلیفان');
INSERT INTO "agahinet"."City" VALUES (130, 2, 'مهاباد');
INSERT INTO "agahinet"."City" VALUES (131, 2, 'باروق');
INSERT INTO "agahinet"."City" VALUES (132, 2, 'چهاربرج');
INSERT INTO "agahinet"."City" VALUES (133, 2, 'میاندوآب');
INSERT INTO "agahinet"."City" VALUES (134, 2, 'محمدیار');
INSERT INTO "agahinet"."City" VALUES (135, 2, 'نقده');
INSERT INTO "agahinet"."City" VALUES (136, 3, 'اردبیل');
INSERT INTO "agahinet"."City" VALUES (137, 3, 'هیر');
INSERT INTO "agahinet"."City" VALUES (138, 3, 'بیله سوار');
INSERT INTO "agahinet"."City" VALUES (139, 3, 'جعفرآباد');
INSERT INTO "agahinet"."City" VALUES (140, 3, 'اسلام اباد');
INSERT INTO "agahinet"."City" VALUES (141, 3, 'اصلاندوز');
INSERT INTO "agahinet"."City" VALUES (142, 3, 'پارس آباد');
INSERT INTO "agahinet"."City" VALUES (143, 3, 'تازه کند');
INSERT INTO "agahinet"."City" VALUES (144, 3, 'خلخال');
INSERT INTO "agahinet"."City" VALUES (145, 3, 'کلور');
INSERT INTO "agahinet"."City" VALUES (146, 3, 'هشتجین');
INSERT INTO "agahinet"."City" VALUES (147, 3, 'سرعین');
INSERT INTO "agahinet"."City" VALUES (148, 3, 'گیوی');
INSERT INTO "agahinet"."City" VALUES (149, 3, 'تازه کندانگوت');
INSERT INTO "agahinet"."City" VALUES (150, 3, 'گرمی');
INSERT INTO "agahinet"."City" VALUES (151, 3, 'رضی');
INSERT INTO "agahinet"."City" VALUES (152, 3, 'فخراباد');
INSERT INTO "agahinet"."City" VALUES (153, 3, 'قصابه');
INSERT INTO "agahinet"."City" VALUES (154, 3, 'لاهرود');
INSERT INTO "agahinet"."City" VALUES (155, 3, 'مرادلو');
INSERT INTO "agahinet"."City" VALUES (156, 3, 'مشگین شهر');
INSERT INTO "agahinet"."City" VALUES (157, 3, 'آبی بیگلو');
INSERT INTO "agahinet"."City" VALUES (158, 3, 'عنبران');
INSERT INTO "agahinet"."City" VALUES (159, 3, 'نمین');
INSERT INTO "agahinet"."City" VALUES (160, 3, 'کوراییم');
INSERT INTO "agahinet"."City" VALUES (161, 3, 'نیر');
INSERT INTO "agahinet"."City" VALUES (162, 4, 'آران وبیدگل');
INSERT INTO "agahinet"."City" VALUES (163, 4, 'ابوزیدآباد');
INSERT INTO "agahinet"."City" VALUES (164, 4, 'سفیدشهر');
INSERT INTO "agahinet"."City" VALUES (165, 4, 'نوش آباد');
INSERT INTO "agahinet"."City" VALUES (166, 4, 'اردستان');
INSERT INTO "agahinet"."City" VALUES (167, 4, 'زواره');
INSERT INTO "agahinet"."City" VALUES (168, 4, 'مهاباد');
INSERT INTO "agahinet"."City" VALUES (169, 4, 'اژیه');
INSERT INTO "agahinet"."City" VALUES (170, 4, 'اصفهان');
INSERT INTO "agahinet"."City" VALUES (171, 4, 'بهارستان');
INSERT INTO "agahinet"."City" VALUES (172, 4, 'تودشک');
INSERT INTO "agahinet"."City" VALUES (173, 4, 'حسن اباد');
INSERT INTO "agahinet"."City" VALUES (174, 4, 'زیار');
INSERT INTO "agahinet"."City" VALUES (175, 4, 'سجزی');
INSERT INTO "agahinet"."City" VALUES (176, 4, 'قهجاورستان');
INSERT INTO "agahinet"."City" VALUES (177, 4, 'کوهپایه');
INSERT INTO "agahinet"."City" VALUES (178, 4, 'محمدآباد');
INSERT INTO "agahinet"."City" VALUES (179, 4, 'نصرآباد');
INSERT INTO "agahinet"."City" VALUES (180, 4, 'نیک آباد');
INSERT INTO "agahinet"."City" VALUES (181, 4, 'ورزنه');
INSERT INTO "agahinet"."City" VALUES (182, 4, 'هرند');
INSERT INTO "agahinet"."City" VALUES (183, 4, 'حبیب آباد');
INSERT INTO "agahinet"."City" VALUES (184, 4, 'خورزوق');
INSERT INTO "agahinet"."City" VALUES (185, 4, 'دستگرد');
INSERT INTO "agahinet"."City" VALUES (186, 4, 'دولت آباد');
INSERT INTO "agahinet"."City" VALUES (187, 4, 'سین');
INSERT INTO "agahinet"."City" VALUES (188, 4, 'شاپورآباد');
INSERT INTO "agahinet"."City" VALUES (189, 4, 'کمشچه');
INSERT INTO "agahinet"."City" VALUES (190, 4, 'افوس');
INSERT INTO "agahinet"."City" VALUES (191, 4, 'بویین ومیاندشت');
INSERT INTO "agahinet"."City" VALUES (192, 4, 'تیران');
INSERT INTO "agahinet"."City" VALUES (193, 4, 'رضوانشهر');
INSERT INTO "agahinet"."City" VALUES (194, 4, 'عسگران');
INSERT INTO "agahinet"."City" VALUES (195, 4, 'چادگان');
INSERT INTO "agahinet"."City" VALUES (196, 4, 'رزوه');
INSERT INTO "agahinet"."City" VALUES (197, 4, 'اصغرآباد');
INSERT INTO "agahinet"."City" VALUES (198, 4, 'خمینی شهر');
INSERT INTO "agahinet"."City" VALUES (199, 4, 'درچه');
INSERT INTO "agahinet"."City" VALUES (200, 4, 'کوشک');
INSERT INTO "agahinet"."City" VALUES (201, 4, 'خوانسار');
INSERT INTO "agahinet"."City" VALUES (202, 4, 'جندق');
INSERT INTO "agahinet"."City" VALUES (203, 4, 'خور');
INSERT INTO "agahinet"."City" VALUES (204, 4, 'فرخی');
INSERT INTO "agahinet"."City" VALUES (205, 4, 'دهاقان');
INSERT INTO "agahinet"."City" VALUES (206, 4, 'گلشن');
INSERT INTO "agahinet"."City" VALUES (207, 4, 'حنا');
INSERT INTO "agahinet"."City" VALUES (208, 4, 'سمیرم');
INSERT INTO "agahinet"."City" VALUES (209, 4, 'کمه');
INSERT INTO "agahinet"."City" VALUES (210, 4, 'ونک');
INSERT INTO "agahinet"."City" VALUES (211, 4, 'شاهین شهر');
INSERT INTO "agahinet"."City" VALUES (212, 4, 'گرگاب');
INSERT INTO "agahinet"."City" VALUES (213, 4, 'گزبرخوار');
INSERT INTO "agahinet"."City" VALUES (214, 4, 'لای بید');
INSERT INTO "agahinet"."City" VALUES (215, 4, 'میمه');
INSERT INTO "agahinet"."City" VALUES (216, 4, 'وزوان');
INSERT INTO "agahinet"."City" VALUES (217, 4, 'شهرضا');
INSERT INTO "agahinet"."City" VALUES (218, 4, 'منظریه');
INSERT INTO "agahinet"."City" VALUES (219, 4, 'داران');
INSERT INTO "agahinet"."City" VALUES (220, 4, 'دامنه');
INSERT INTO "agahinet"."City" VALUES (221, 4, 'برف انبار');
INSERT INTO "agahinet"."City" VALUES (222, 4, 'فریدونشهر');
INSERT INTO "agahinet"."City" VALUES (223, 4, 'ابریشم');
INSERT INTO "agahinet"."City" VALUES (224, 4, 'ایمانشهر');
INSERT INTO "agahinet"."City" VALUES (225, 4, 'بهاران شهر');
INSERT INTO "agahinet"."City" VALUES (226, 4, 'پیربکران');
INSERT INTO "agahinet"."City" VALUES (227, 4, 'زازران');
INSERT INTO "agahinet"."City" VALUES (228, 4, 'فلاورجان');
INSERT INTO "agahinet"."City" VALUES (229, 4, 'قهدریجان');
INSERT INTO "agahinet"."City" VALUES (230, 4, 'کلیشادوسودرجان');
INSERT INTO "agahinet"."City" VALUES (231, 4, 'برزک');
INSERT INTO "agahinet"."City" VALUES (232, 4, 'جوشقان قالی');
INSERT INTO "agahinet"."City" VALUES (233, 4, 'قمصر');
INSERT INTO "agahinet"."City" VALUES (234, 4, 'کاشان');
INSERT INTO "agahinet"."City" VALUES (235, 4, 'کامو و چوگان');
INSERT INTO "agahinet"."City" VALUES (236, 4, 'مشکات');
INSERT INTO "agahinet"."City" VALUES (237, 4, 'نیاسر');
INSERT INTO "agahinet"."City" VALUES (238, 4, 'گلپایگان');
INSERT INTO "agahinet"."City" VALUES (239, 4, 'گلشهر');
INSERT INTO "agahinet"."City" VALUES (240, 4, 'گوگد');
INSERT INTO "agahinet"."City" VALUES (241, 4, 'باغ بهادران');
INSERT INTO "agahinet"."City" VALUES (242, 4, 'باغشاد');
INSERT INTO "agahinet"."City" VALUES (243, 4, 'چرمهین');
INSERT INTO "agahinet"."City" VALUES (244, 4, 'چمگردان');
INSERT INTO "agahinet"."City" VALUES (245, 4, 'زاینده رود');
INSERT INTO "agahinet"."City" VALUES (246, 4, 'زرین شهر');
INSERT INTO "agahinet"."City" VALUES (247, 4, 'سده لنجان');
INSERT INTO "agahinet"."City" VALUES (248, 4, 'فولادشهر');
INSERT INTO "agahinet"."City" VALUES (249, 4, 'ورنامخواست');
INSERT INTO "agahinet"."City" VALUES (250, 4, 'دیزیچه');
INSERT INTO "agahinet"."City" VALUES (251, 4, 'زیباشهر');
INSERT INTO "agahinet"."City" VALUES (252, 4, 'طالخونچه');
INSERT INTO "agahinet"."City" VALUES (253, 4, 'کرکوند');
INSERT INTO "agahinet"."City" VALUES (254, 4, 'مبارکه');
INSERT INTO "agahinet"."City" VALUES (255, 4, 'مجلسی');
INSERT INTO "agahinet"."City" VALUES (256, 4, 'انارک');
INSERT INTO "agahinet"."City" VALUES (257, 4, 'بافران');
INSERT INTO "agahinet"."City" VALUES (258, 4, 'نایین');
INSERT INTO "agahinet"."City" VALUES (259, 4, 'جوزدان');
INSERT INTO "agahinet"."City" VALUES (260, 4, 'دهق');
INSERT INTO "agahinet"."City" VALUES (261, 4, 'علویجه');
INSERT INTO "agahinet"."City" VALUES (262, 4, 'کهریزسنگ');
INSERT INTO "agahinet"."City" VALUES (263, 4, 'گلدشت');
INSERT INTO "agahinet"."City" VALUES (264, 4, 'نجف آباد');
INSERT INTO "agahinet"."City" VALUES (265, 4, 'بادرود');
INSERT INTO "agahinet"."City" VALUES (266, 4, 'خالدآباد');
INSERT INTO "agahinet"."City" VALUES (267, 4, 'طرق رود');
INSERT INTO "agahinet"."City" VALUES (268, 4, 'نطنز');
INSERT INTO "agahinet"."City" VALUES (269, 5, 'اشتهارد');
INSERT INTO "agahinet"."City" VALUES (270, 5, 'چهارباغ');
INSERT INTO "agahinet"."City" VALUES (271, 5, 'شهرجدیدهشتگرد');
INSERT INTO "agahinet"."City" VALUES (272, 5, 'کوهسار');
INSERT INTO "agahinet"."City" VALUES (273, 5, 'گلسار');
INSERT INTO "agahinet"."City" VALUES (274, 5, 'هشتگرد');
INSERT INTO "agahinet"."City" VALUES (275, 5, 'طالقان');
INSERT INTO "agahinet"."City" VALUES (276, 5, 'فردیس');
INSERT INTO "agahinet"."City" VALUES (277, 5, 'مشکین دشت');
INSERT INTO "agahinet"."City" VALUES (278, 5, 'آسارا');
INSERT INTO "agahinet"."City" VALUES (279, 5, 'کرج');
INSERT INTO "agahinet"."City" VALUES (280, 5, 'کمال شهر');
INSERT INTO "agahinet"."City" VALUES (281, 5, 'گرمدره');
INSERT INTO "agahinet"."City" VALUES (282, 5, 'ماهدشت');
INSERT INTO "agahinet"."City" VALUES (283, 5, 'محمدشهر');
INSERT INTO "agahinet"."City" VALUES (284, 5, 'تنکمان');
INSERT INTO "agahinet"."City" VALUES (285, 5, 'نظرآباد');
INSERT INTO "agahinet"."City" VALUES (286, 6, 'آبدانان');
INSERT INTO "agahinet"."City" VALUES (287, 6, 'سراب باغ');
INSERT INTO "agahinet"."City" VALUES (288, 6, 'مورموری');
INSERT INTO "agahinet"."City" VALUES (289, 6, 'ایلام');
INSERT INTO "agahinet"."City" VALUES (290, 6, 'چوار');
INSERT INTO "agahinet"."City" VALUES (291, 6, 'ایوان');
INSERT INTO "agahinet"."City" VALUES (292, 6, 'زرنه');
INSERT INTO "agahinet"."City" VALUES (293, 6, 'بدره');
INSERT INTO "agahinet"."City" VALUES (294, 6, 'آسمان آباد');
INSERT INTO "agahinet"."City" VALUES (295, 6, 'بلاوه');
INSERT INTO "agahinet"."City" VALUES (296, 6, 'توحید');
INSERT INTO "agahinet"."City" VALUES (297, 6, 'سرابله');
INSERT INTO "agahinet"."City" VALUES (298, 6, 'شباب');
INSERT INTO "agahinet"."City" VALUES (299, 6, 'دره شهر');
INSERT INTO "agahinet"."City" VALUES (300, 6, 'ماژین');
INSERT INTO "agahinet"."City" VALUES (301, 6, 'پهله');
INSERT INTO "agahinet"."City" VALUES (302, 6, 'دهلران');
INSERT INTO "agahinet"."City" VALUES (303, 6, 'موسیان');
INSERT INTO "agahinet"."City" VALUES (304, 6, 'میمه');
INSERT INTO "agahinet"."City" VALUES (305, 6, 'لومار');
INSERT INTO "agahinet"."City" VALUES (306, 6, 'ارکواز');
INSERT INTO "agahinet"."City" VALUES (307, 6, 'دلگشا');
INSERT INTO "agahinet"."City" VALUES (308, 6, 'مهر');
INSERT INTO "agahinet"."City" VALUES (309, 6, 'صالح آباد');
INSERT INTO "agahinet"."City" VALUES (310, 6, 'مهران');
INSERT INTO "agahinet"."City" VALUES (311, 7, 'بوشهر');
INSERT INTO "agahinet"."City" VALUES (312, 7, 'چغادک');
INSERT INTO "agahinet"."City" VALUES (313, 7, 'خارک');
INSERT INTO "agahinet"."City" VALUES (314, 7, 'عالی شهر');
INSERT INTO "agahinet"."City" VALUES (315, 7, 'آباد');
INSERT INTO "agahinet"."City" VALUES (316, 7, 'اهرم');
INSERT INTO "agahinet"."City" VALUES (317, 7, 'دلوار');
INSERT INTO "agahinet"."City" VALUES (318, 7, 'انارستان');
INSERT INTO "agahinet"."City" VALUES (319, 7, 'جم');
INSERT INTO "agahinet"."City" VALUES (320, 7, 'ریز');
INSERT INTO "agahinet"."City" VALUES (321, 7, 'آب پخش');
INSERT INTO "agahinet"."City" VALUES (322, 7, 'برازجان');
INSERT INTO "agahinet"."City" VALUES (323, 7, 'بوشکان');
INSERT INTO "agahinet"."City" VALUES (324, 7, 'تنگ ارم');
INSERT INTO "agahinet"."City" VALUES (325, 7, 'دالکی');
INSERT INTO "agahinet"."City" VALUES (326, 7, 'سعد آباد');
INSERT INTO "agahinet"."City" VALUES (327, 7, 'شبانکاره');
INSERT INTO "agahinet"."City" VALUES (328, 7, 'کلمه');
INSERT INTO "agahinet"."City" VALUES (329, 7, 'وحدتیه');
INSERT INTO "agahinet"."City" VALUES (330, 7, 'بادوله');
INSERT INTO "agahinet"."City" VALUES (331, 7, 'خورموج');
INSERT INTO "agahinet"."City" VALUES (332, 7, 'شنبه');
INSERT INTO "agahinet"."City" VALUES (333, 7, 'کاکی');
INSERT INTO "agahinet"."City" VALUES (334, 7, 'آبدان');
INSERT INTO "agahinet"."City" VALUES (335, 7, 'بردخون');
INSERT INTO "agahinet"."City" VALUES (336, 7, 'بردستان');
INSERT INTO "agahinet"."City" VALUES (337, 7, 'بندردیر');
INSERT INTO "agahinet"."City" VALUES (338, 7, 'دوراهک');
INSERT INTO "agahinet"."City" VALUES (339, 7, 'امام حسن');
INSERT INTO "agahinet"."City" VALUES (340, 7, 'بندردیلم');
INSERT INTO "agahinet"."City" VALUES (341, 7, 'عسلویه');
INSERT INTO "agahinet"."City" VALUES (342, 7, 'نخل تقی');
INSERT INTO "agahinet"."City" VALUES (343, 7, 'بندرکنگان');
INSERT INTO "agahinet"."City" VALUES (344, 7, 'بنک');
INSERT INTO "agahinet"."City" VALUES (345, 7, 'سیراف');
INSERT INTO "agahinet"."City" VALUES (346, 7, 'بندرریگ');
INSERT INTO "agahinet"."City" VALUES (347, 7, 'بندرگناوه');
INSERT INTO "agahinet"."City" VALUES (348, 8, 'احمد آباد مستوفی');
INSERT INTO "agahinet"."City" VALUES (349, 8, 'اسلامشهر');
INSERT INTO "agahinet"."City" VALUES (350, 8, 'چهاردانگه');
INSERT INTO "agahinet"."City" VALUES (351, 8, 'صالحیه');
INSERT INTO "agahinet"."City" VALUES (352, 8, 'گلستان');
INSERT INTO "agahinet"."City" VALUES (353, 8, 'نسیم شهر');
INSERT INTO "agahinet"."City" VALUES (354, 8, 'پاکدشت');
INSERT INTO "agahinet"."City" VALUES (355, 8, 'شریف آباد');
INSERT INTO "agahinet"."City" VALUES (356, 8, 'فرون اباد');
INSERT INTO "agahinet"."City" VALUES (357, 8, 'بومهن');
INSERT INTO "agahinet"."City" VALUES (358, 8, 'پردیس');
INSERT INTO "agahinet"."City" VALUES (359, 8, 'پیشوا');
INSERT INTO "agahinet"."City" VALUES (360, 8, 'تهران');
INSERT INTO "agahinet"."City" VALUES (361, 8, 'آبسرد');
INSERT INTO "agahinet"."City" VALUES (362, 8, 'آبعلی');
INSERT INTO "agahinet"."City" VALUES (363, 8, 'دماوند');
INSERT INTO "agahinet"."City" VALUES (364, 8, 'رودهن');
INSERT INTO "agahinet"."City" VALUES (365, 8, 'کیلان');
INSERT INTO "agahinet"."City" VALUES (366, 8, 'پرند');
INSERT INTO "agahinet"."City" VALUES (367, 8, 'رباطکریم');
INSERT INTO "agahinet"."City" VALUES (368, 8, 'نصیرشهر');
INSERT INTO "agahinet"."City" VALUES (369, 8, 'باقرشهر');
INSERT INTO "agahinet"."City" VALUES (370, 8, 'حسن آباد');
INSERT INTO "agahinet"."City" VALUES (371, 8, 'ری');
INSERT INTO "agahinet"."City" VALUES (372, 8, 'کهریزک');
INSERT INTO "agahinet"."City" VALUES (373, 8, 'تجریش');
INSERT INTO "agahinet"."City" VALUES (374, 8, 'شمشک');
INSERT INTO "agahinet"."City" VALUES (375, 8, 'فشم');
INSERT INTO "agahinet"."City" VALUES (376, 8, 'لواسان');
INSERT INTO "agahinet"."City" VALUES (377, 8, 'اندیشه');
INSERT INTO "agahinet"."City" VALUES (378, 8, 'باغستان');
INSERT INTO "agahinet"."City" VALUES (379, 8, 'شاهدشهر');
INSERT INTO "agahinet"."City" VALUES (380, 8, 'شهریار');
INSERT INTO "agahinet"."City" VALUES (381, 8, 'صباشهر');
INSERT INTO "agahinet"."City" VALUES (382, 8, 'فردوسیه');
INSERT INTO "agahinet"."City" VALUES (383, 8, 'وحیدیه');
INSERT INTO "agahinet"."City" VALUES (384, 8, 'ارجمند');
INSERT INTO "agahinet"."City" VALUES (385, 8, 'فیروزکوه');
INSERT INTO "agahinet"."City" VALUES (386, 8, 'قدس');
INSERT INTO "agahinet"."City" VALUES (387, 8, 'قرچک');
INSERT INTO "agahinet"."City" VALUES (388, 8, 'صفادشت');
INSERT INTO "agahinet"."City" VALUES (389, 8, 'ملارد');
INSERT INTO "agahinet"."City" VALUES (390, 8, 'جوادآباد');
INSERT INTO "agahinet"."City" VALUES (391, 8, 'ورامین');
INSERT INTO "agahinet"."City" VALUES (392, 9, 'اردل');
INSERT INTO "agahinet"."City" VALUES (393, 9, 'دشتک');
INSERT INTO "agahinet"."City" VALUES (394, 9, 'سرخون');
INSERT INTO "agahinet"."City" VALUES (395, 9, 'کاج');
INSERT INTO "agahinet"."City" VALUES (396, 9, 'بروجن');
INSERT INTO "agahinet"."City" VALUES (397, 9, 'بلداجی');
INSERT INTO "agahinet"."City" VALUES (398, 9, 'سفیددشت');
INSERT INTO "agahinet"."City" VALUES (399, 9, 'فرادبنه');
INSERT INTO "agahinet"."City" VALUES (400, 9, 'گندمان');
INSERT INTO "agahinet"."City" VALUES (401, 9, 'نقنه');
INSERT INTO "agahinet"."City" VALUES (402, 9, 'بن');
INSERT INTO "agahinet"."City" VALUES (403, 9, 'وردنجان');
INSERT INTO "agahinet"."City" VALUES (404, 9, 'سامان');
INSERT INTO "agahinet"."City" VALUES (405, 9, 'سودجان');
INSERT INTO "agahinet"."City" VALUES (406, 9, 'سورشجان');
INSERT INTO "agahinet"."City" VALUES (407, 9, 'شهرکرد');
INSERT INTO "agahinet"."City" VALUES (408, 9, 'طاقانک');
INSERT INTO "agahinet"."City" VALUES (409, 9, 'فرخ شهر');
INSERT INTO "agahinet"."City" VALUES (410, 9, 'کیان');
INSERT INTO "agahinet"."City" VALUES (411, 9, 'نافچ');
INSERT INTO "agahinet"."City" VALUES (412, 9, 'هارونی');
INSERT INTO "agahinet"."City" VALUES (413, 9, 'هفشجان');
INSERT INTO "agahinet"."City" VALUES (414, 9, 'باباحیدر');
INSERT INTO "agahinet"."City" VALUES (415, 9, 'پردنجان');
INSERT INTO "agahinet"."City" VALUES (416, 9, 'جونقان');
INSERT INTO "agahinet"."City" VALUES (417, 9, 'چلیچه');
INSERT INTO "agahinet"."City" VALUES (418, 9, 'فارسان');
INSERT INTO "agahinet"."City" VALUES (419, 9, 'گوجان');
INSERT INTO "agahinet"."City" VALUES (420, 9, 'بازفت');
INSERT INTO "agahinet"."City" VALUES (421, 9, 'چلگرد');
INSERT INTO "agahinet"."City" VALUES (422, 9, 'صمصامی');
INSERT INTO "agahinet"."City" VALUES (423, 9, 'دستنا');
INSERT INTO "agahinet"."City" VALUES (424, 9, 'شلمزار');
INSERT INTO "agahinet"."City" VALUES (425, 9, 'گهرو');
INSERT INTO "agahinet"."City" VALUES (426, 9, 'ناغان');
INSERT INTO "agahinet"."City" VALUES (427, 9, 'آلونی');
INSERT INTO "agahinet"."City" VALUES (428, 9, 'سردشت');
INSERT INTO "agahinet"."City" VALUES (429, 9, 'لردگان');
INSERT INTO "agahinet"."City" VALUES (430, 9, 'مال خلیفه');
INSERT INTO "agahinet"."City" VALUES (431, 9, 'منج');
INSERT INTO "agahinet"."City" VALUES (432, 10, 'ارسک');
INSERT INTO "agahinet"."City" VALUES (433, 10, 'بشرویه');
INSERT INTO "agahinet"."City" VALUES (434, 10, 'بیرجند');
INSERT INTO "agahinet"."City" VALUES (435, 10, 'خوسف');
INSERT INTO "agahinet"."City" VALUES (436, 10, 'محمدشهر');
INSERT INTO "agahinet"."City" VALUES (437, 10, 'اسدیه');
INSERT INTO "agahinet"."City" VALUES (438, 10, 'طبس مسینا');
INSERT INTO "agahinet"."City" VALUES (439, 10, 'قهستان');
INSERT INTO "agahinet"."City" VALUES (440, 10, 'گزیک');
INSERT INTO "agahinet"."City" VALUES (441, 10, 'حاجی آباد');
INSERT INTO "agahinet"."City" VALUES (442, 10, 'زهان');
INSERT INTO "agahinet"."City" VALUES (443, 10, 'آیسک');
INSERT INTO "agahinet"."City" VALUES (444, 10, 'سرایان');
INSERT INTO "agahinet"."City" VALUES (445, 10, 'سه قلعه');
INSERT INTO "agahinet"."City" VALUES (446, 10, 'سربیشه');
INSERT INTO "agahinet"."City" VALUES (447, 10, 'مود');
INSERT INTO "agahinet"."City" VALUES (448, 10, 'دیهوک');
INSERT INTO "agahinet"."City" VALUES (449, 10, 'طبس');
INSERT INTO "agahinet"."City" VALUES (450, 10, 'عشق آباد');
INSERT INTO "agahinet"."City" VALUES (451, 10, 'اسلامیه');
INSERT INTO "agahinet"."City" VALUES (452, 10, 'فردوس');
INSERT INTO "agahinet"."City" VALUES (453, 10, 'آرین شهر');
INSERT INTO "agahinet"."City" VALUES (454, 10, 'اسفدن');
INSERT INTO "agahinet"."City" VALUES (455, 10, 'خضری دشت بیاض');
INSERT INTO "agahinet"."City" VALUES (456, 10, 'قاین');
INSERT INTO "agahinet"."City" VALUES (457, 10, 'نیمبلوک');
INSERT INTO "agahinet"."City" VALUES (458, 10, 'شوسف');
INSERT INTO "agahinet"."City" VALUES (459, 10, 'نهبندان');
INSERT INTO "agahinet"."City" VALUES (460, 11, 'باخرز');
INSERT INTO "agahinet"."City" VALUES (461, 11, 'بجستان');
INSERT INTO "agahinet"."City" VALUES (462, 11, 'یونسی');
INSERT INTO "agahinet"."City" VALUES (463, 11, 'انابد');
INSERT INTO "agahinet"."City" VALUES (464, 11, 'بردسکن');
INSERT INTO "agahinet"."City" VALUES (465, 11, 'شهراباد');
INSERT INTO "agahinet"."City" VALUES (466, 11, 'شاندیز');
INSERT INTO "agahinet"."City" VALUES (467, 11, 'طرقبه');
INSERT INTO "agahinet"."City" VALUES (468, 11, 'تایباد');
INSERT INTO "agahinet"."City" VALUES (469, 11, 'کاریز');
INSERT INTO "agahinet"."City" VALUES (470, 11, 'مشهدریزه');
INSERT INTO "agahinet"."City" VALUES (471, 11, 'احمدابادصولت');
INSERT INTO "agahinet"."City" VALUES (472, 11, 'تربت جام');
INSERT INTO "agahinet"."City" VALUES (473, 11, 'صالح آباد');
INSERT INTO "agahinet"."City" VALUES (474, 11, 'نصرآباد');
INSERT INTO "agahinet"."City" VALUES (475, 11, 'نیل شهر');
INSERT INTO "agahinet"."City" VALUES (476, 11, 'بایک');
INSERT INTO "agahinet"."City" VALUES (477, 11, 'تربت حیدریه');
INSERT INTO "agahinet"."City" VALUES (478, 11, 'رباط سنگ');
INSERT INTO "agahinet"."City" VALUES (479, 11, 'کدکن');
INSERT INTO "agahinet"."City" VALUES (480, 11, 'جغتای');
INSERT INTO "agahinet"."City" VALUES (481, 11, 'نقاب');
INSERT INTO "agahinet"."City" VALUES (482, 11, 'چناران');
INSERT INTO "agahinet"."City" VALUES (483, 11, 'گلبهار');
INSERT INTO "agahinet"."City" VALUES (484, 11, 'گلمکان');
INSERT INTO "agahinet"."City" VALUES (485, 11, 'خلیل آباد');
INSERT INTO "agahinet"."City" VALUES (486, 11, 'کندر');
INSERT INTO "agahinet"."City" VALUES (487, 11, 'خواف');
INSERT INTO "agahinet"."City" VALUES (488, 11, 'سلامی');
INSERT INTO "agahinet"."City" VALUES (489, 11, 'سنگان');
INSERT INTO "agahinet"."City" VALUES (490, 11, 'قاسم آباد');
INSERT INTO "agahinet"."City" VALUES (491, 11, 'نشتیفان');
INSERT INTO "agahinet"."City" VALUES (492, 11, 'سلطان آباد');
INSERT INTO "agahinet"."City" VALUES (493, 11, 'داورزن');
INSERT INTO "agahinet"."City" VALUES (494, 11, 'چاپشلو');
INSERT INTO "agahinet"."City" VALUES (495, 11, 'درگز');
INSERT INTO "agahinet"."City" VALUES (496, 11, 'لطف آباد');
INSERT INTO "agahinet"."City" VALUES (497, 11, 'نوخندان');
INSERT INTO "agahinet"."City" VALUES (498, 11, 'جنگل');
INSERT INTO "agahinet"."City" VALUES (499, 11, 'رشتخوار');
INSERT INTO "agahinet"."City" VALUES (500, 11, 'دولت آباد');
INSERT INTO "agahinet"."City" VALUES (501, 11, 'روداب');
INSERT INTO "agahinet"."City" VALUES (502, 11, 'سبزوار');
INSERT INTO "agahinet"."City" VALUES (503, 11, 'ششتمد');
INSERT INTO "agahinet"."City" VALUES (504, 11, 'سرخس');
INSERT INTO "agahinet"."City" VALUES (505, 11, 'مزدآوند');
INSERT INTO "agahinet"."City" VALUES (506, 11, 'سفیدسنگ');
INSERT INTO "agahinet"."City" VALUES (507, 11, 'فرهادگرد');
INSERT INTO "agahinet"."City" VALUES (508, 11, 'فریمان');
INSERT INTO "agahinet"."City" VALUES (509, 11, 'قلندرآباد');
INSERT INTO "agahinet"."City" VALUES (510, 11, 'فیروزه');
INSERT INTO "agahinet"."City" VALUES (511, 11, 'همت آباد');
INSERT INTO "agahinet"."City" VALUES (512, 11, 'باجگیران');
INSERT INTO "agahinet"."City" VALUES (513, 11, 'قوچان');
INSERT INTO "agahinet"."City" VALUES (514, 11, 'ریوش');
INSERT INTO "agahinet"."City" VALUES (515, 11, 'کاشمر');
INSERT INTO "agahinet"."City" VALUES (516, 11, 'شهرزو');
INSERT INTO "agahinet"."City" VALUES (517, 11, 'کلات');
INSERT INTO "agahinet"."City" VALUES (518, 11, 'بیدخت');
INSERT INTO "agahinet"."City" VALUES (519, 11, 'کاخک');
INSERT INTO "agahinet"."City" VALUES (520, 11, 'گناباد');
INSERT INTO "agahinet"."City" VALUES (521, 11, 'رضویه');
INSERT INTO "agahinet"."City" VALUES (522, 11, 'مشهد');
INSERT INTO "agahinet"."City" VALUES (523, 11, 'مشهد ثامن');
INSERT INTO "agahinet"."City" VALUES (524, 11, 'ملک آباد');
INSERT INTO "agahinet"."City" VALUES (525, 11, 'شادمهر');
INSERT INTO "agahinet"."City" VALUES (526, 11, 'فیض آباد');
INSERT INTO "agahinet"."City" VALUES (527, 11, 'بار');
INSERT INTO "agahinet"."City" VALUES (528, 11, 'چکنه');
INSERT INTO "agahinet"."City" VALUES (529, 11, 'خرو');
INSERT INTO "agahinet"."City" VALUES (530, 11, 'درود');
INSERT INTO "agahinet"."City" VALUES (531, 11, 'عشق آباد');
INSERT INTO "agahinet"."City" VALUES (532, 11, 'قدمگاه');
INSERT INTO "agahinet"."City" VALUES (533, 11, 'نیشابور');
INSERT INTO "agahinet"."City" VALUES (534, 12, 'اسفراین');
INSERT INTO "agahinet"."City" VALUES (535, 12, 'صفی آباد');
INSERT INTO "agahinet"."City" VALUES (536, 12, 'بجنورد');
INSERT INTO "agahinet"."City" VALUES (537, 12, 'چناران شهر');
INSERT INTO "agahinet"."City" VALUES (538, 12, 'حصارگرمخان');
INSERT INTO "agahinet"."City" VALUES (539, 12, 'جاجرم');
INSERT INTO "agahinet"."City" VALUES (540, 12, 'سنخواست');
INSERT INTO "agahinet"."City" VALUES (541, 12, 'شوقان');
INSERT INTO "agahinet"."City" VALUES (542, 12, 'راز');
INSERT INTO "agahinet"."City" VALUES (543, 12, 'زیارت');
INSERT INTO "agahinet"."City" VALUES (544, 12, 'شیروان');
INSERT INTO "agahinet"."City" VALUES (545, 12, 'قوشخانه');
INSERT INTO "agahinet"."City" VALUES (546, 12, 'لوجلی');
INSERT INTO "agahinet"."City" VALUES (547, 12, 'تیتکانلو');
INSERT INTO "agahinet"."City" VALUES (548, 12, 'فاروج');
INSERT INTO "agahinet"."City" VALUES (549, 12, 'ایور');
INSERT INTO "agahinet"."City" VALUES (550, 12, 'درق');
INSERT INTO "agahinet"."City" VALUES (551, 12, 'گرمه');
INSERT INTO "agahinet"."City" VALUES (552, 12, 'آشخانه');
INSERT INTO "agahinet"."City" VALUES (553, 12, 'آوا');
INSERT INTO "agahinet"."City" VALUES (554, 12, 'پیش قلعه');
INSERT INTO "agahinet"."City" VALUES (555, 12, 'قاضی');
INSERT INTO "agahinet"."City" VALUES (556, 13, 'آبادان');
INSERT INTO "agahinet"."City" VALUES (557, 13, 'اروندکنار');
INSERT INTO "agahinet"."City" VALUES (558, 13, 'چویبده');
INSERT INTO "agahinet"."City" VALUES (559, 13, 'آغاجاری');
INSERT INTO "agahinet"."City" VALUES (560, 13, 'امیدیه');
INSERT INTO "agahinet"."City" VALUES (561, 13, 'جایزان');
INSERT INTO "agahinet"."City" VALUES (562, 13, 'آبژدان');
INSERT INTO "agahinet"."City" VALUES (563, 13, 'قلعه خواجه');
INSERT INTO "agahinet"."City" VALUES (564, 13, 'آزادی');
INSERT INTO "agahinet"."City" VALUES (565, 13, 'اندیمشک');
INSERT INTO "agahinet"."City" VALUES (566, 13, 'بیدروبه');
INSERT INTO "agahinet"."City" VALUES (567, 13, 'چم گلک');
INSERT INTO "agahinet"."City" VALUES (568, 13, 'حسینیه');
INSERT INTO "agahinet"."City" VALUES (569, 13, 'الهایی');
INSERT INTO "agahinet"."City" VALUES (570, 13, 'اهواز');
INSERT INTO "agahinet"."City" VALUES (571, 13, 'ایذه');
INSERT INTO "agahinet"."City" VALUES (572, 13, 'دهدز');
INSERT INTO "agahinet"."City" VALUES (573, 13, 'باغ ملک');
INSERT INTO "agahinet"."City" VALUES (574, 13, 'صیدون');
INSERT INTO "agahinet"."City" VALUES (575, 13, 'قلعه تل');
INSERT INTO "agahinet"."City" VALUES (576, 13, 'میداود');
INSERT INTO "agahinet"."City" VALUES (577, 13, 'شیبان');
INSERT INTO "agahinet"."City" VALUES (578, 13, 'ملاثانی');
INSERT INTO "agahinet"."City" VALUES (579, 13, 'ویس');
INSERT INTO "agahinet"."City" VALUES (580, 13, 'بندرامام خمینی');
INSERT INTO "agahinet"."City" VALUES (581, 13, 'بندرماهشهر');
INSERT INTO "agahinet"."City" VALUES (582, 13, 'چمران');
INSERT INTO "agahinet"."City" VALUES (583, 13, 'بهبهان');
INSERT INTO "agahinet"."City" VALUES (584, 13, 'تشان');
INSERT INTO "agahinet"."City" VALUES (585, 13, 'سردشت');
INSERT INTO "agahinet"."City" VALUES (586, 13, 'منصوریه');
INSERT INTO "agahinet"."City" VALUES (587, 13, 'حمیدیه');
INSERT INTO "agahinet"."City" VALUES (588, 13, 'خرمشهر');
INSERT INTO "agahinet"."City" VALUES (589, 13, 'مقاومت');
INSERT INTO "agahinet"."City" VALUES (590, 13, 'مینوشهر');
INSERT INTO "agahinet"."City" VALUES (591, 13, 'چغامیش');
INSERT INTO "agahinet"."City" VALUES (592, 13, 'حمزه');
INSERT INTO "agahinet"."City" VALUES (593, 13, 'دزفول');
INSERT INTO "agahinet"."City" VALUES (594, 13, 'سالند');
INSERT INTO "agahinet"."City" VALUES (595, 13, 'سیاه منصور');
INSERT INTO "agahinet"."City" VALUES (596, 13, 'شمس آباد');
INSERT INTO "agahinet"."City" VALUES (597, 13, 'شهر امام');
INSERT INTO "agahinet"."City" VALUES (598, 13, 'صفی آباد');
INSERT INTO "agahinet"."City" VALUES (599, 13, 'میانرود');
INSERT INTO "agahinet"."City" VALUES (600, 13, 'ابوحمیظه');
INSERT INTO "agahinet"."City" VALUES (601, 13, 'بستان');
INSERT INTO "agahinet"."City" VALUES (602, 13, 'سوسنگرد');
INSERT INTO "agahinet"."City" VALUES (603, 13, 'کوت سیدنعیم');
INSERT INTO "agahinet"."City" VALUES (604, 13, 'رامشیر');
INSERT INTO "agahinet"."City" VALUES (605, 13, 'مشراگه');
INSERT INTO "agahinet"."City" VALUES (606, 13, 'رامهرمز');
INSERT INTO "agahinet"."City" VALUES (607, 13, 'خنافره');
INSERT INTO "agahinet"."City" VALUES (608, 13, 'دارخوین');
INSERT INTO "agahinet"."City" VALUES (609, 13, 'شادگان');
INSERT INTO "agahinet"."City" VALUES (610, 13, 'الوان');
INSERT INTO "agahinet"."City" VALUES (611, 13, 'حر');
INSERT INTO "agahinet"."City" VALUES (612, 13, 'شاوور');
INSERT INTO "agahinet"."City" VALUES (613, 13, 'شوش');
INSERT INTO "agahinet"."City" VALUES (614, 13, 'فتح المبین');
INSERT INTO "agahinet"."City" VALUES (615, 13, 'سرداران');
INSERT INTO "agahinet"."City" VALUES (616, 13, 'شرافت');
INSERT INTO "agahinet"."City" VALUES (617, 13, 'شوشتر');
INSERT INTO "agahinet"."City" VALUES (618, 13, 'گوریه');
INSERT INTO "agahinet"."City" VALUES (619, 13, 'کوت عبداله');
INSERT INTO "agahinet"."City" VALUES (620, 13, 'ترکالکی');
INSERT INTO "agahinet"."City" VALUES (621, 13, 'جنت مکان');
INSERT INTO "agahinet"."City" VALUES (622, 13, 'سماله');
INSERT INTO "agahinet"."City" VALUES (623, 13, 'صالح شهر');
INSERT INTO "agahinet"."City" VALUES (624, 13, 'گتوند');
INSERT INTO "agahinet"."City" VALUES (625, 13, 'لالی');
INSERT INTO "agahinet"."City" VALUES (626, 13, 'گلگیر');
INSERT INTO "agahinet"."City" VALUES (627, 13, 'مسجدسلیمان');
INSERT INTO "agahinet"."City" VALUES (628, 13, 'هفتگل');
INSERT INTO "agahinet"."City" VALUES (629, 13, 'زهره');
INSERT INTO "agahinet"."City" VALUES (630, 13, 'هندیجان');
INSERT INTO "agahinet"."City" VALUES (631, 13, 'رفیع');
INSERT INTO "agahinet"."City" VALUES (632, 13, 'هویزه');
INSERT INTO "agahinet"."City" VALUES (633, 14, 'ابهر');
INSERT INTO "agahinet"."City" VALUES (634, 14, 'صایین قلعه');
INSERT INTO "agahinet"."City" VALUES (635, 14, 'هیدج');
INSERT INTO "agahinet"."City" VALUES (636, 14, 'حلب');
INSERT INTO "agahinet"."City" VALUES (637, 14, 'زرین آباد');
INSERT INTO "agahinet"."City" VALUES (638, 14, 'زرین رود');
INSERT INTO "agahinet"."City" VALUES (639, 14, 'سجاس');
INSERT INTO "agahinet"."City" VALUES (640, 14, 'سهرورد');
INSERT INTO "agahinet"."City" VALUES (641, 14, 'قیدار');
INSERT INTO "agahinet"."City" VALUES (642, 14, 'کرسف');
INSERT INTO "agahinet"."City" VALUES (643, 14, 'گرماب');
INSERT INTO "agahinet"."City" VALUES (644, 14, 'نوربهار');
INSERT INTO "agahinet"."City" VALUES (645, 14, 'خرمدره');
INSERT INTO "agahinet"."City" VALUES (646, 14, 'ارمغانخانه');
INSERT INTO "agahinet"."City" VALUES (647, 14, 'زنجان');
INSERT INTO "agahinet"."City" VALUES (648, 14, 'نیک پی');
INSERT INTO "agahinet"."City" VALUES (649, 14, 'سلطانیه');
INSERT INTO "agahinet"."City" VALUES (650, 14, 'آب بر');
INSERT INTO "agahinet"."City" VALUES (651, 14, 'چورزق');
INSERT INTO "agahinet"."City" VALUES (652, 14, 'دندی');
INSERT INTO "agahinet"."City" VALUES (653, 14, 'ماه نشان');
INSERT INTO "agahinet"."City" VALUES (654, 15, 'آرادان');
INSERT INTO "agahinet"."City" VALUES (655, 15, 'کهن آباد');
INSERT INTO "agahinet"."City" VALUES (656, 15, 'امیریه');
INSERT INTO "agahinet"."City" VALUES (657, 15, 'دامغان');
INSERT INTO "agahinet"."City" VALUES (658, 15, 'دیباج');
INSERT INTO "agahinet"."City" VALUES (659, 15, 'کلاته');
INSERT INTO "agahinet"."City" VALUES (660, 15, 'سرخه');
INSERT INTO "agahinet"."City" VALUES (661, 15, 'سمنان');
INSERT INTO "agahinet"."City" VALUES (662, 15, 'بسطام');
INSERT INTO "agahinet"."City" VALUES (663, 15, 'بیارجمند');
INSERT INTO "agahinet"."City" VALUES (664, 15, 'رودیان');
INSERT INTO "agahinet"."City" VALUES (665, 15, 'شاهرود');
INSERT INTO "agahinet"."City" VALUES (666, 15, 'کلاته خیج');
INSERT INTO "agahinet"."City" VALUES (667, 15, 'مجن');
INSERT INTO "agahinet"."City" VALUES (668, 15, 'ایوانکی');
INSERT INTO "agahinet"."City" VALUES (669, 15, 'گرمسار');
INSERT INTO "agahinet"."City" VALUES (670, 15, 'درجزین');
INSERT INTO "agahinet"."City" VALUES (671, 15, 'شهمیرزاد');
INSERT INTO "agahinet"."City" VALUES (672, 15, 'مهدی شهر');
INSERT INTO "agahinet"."City" VALUES (673, 15, 'میامی');
INSERT INTO "agahinet"."City" VALUES (674, 16, 'ایرانشهر');
INSERT INTO "agahinet"."City" VALUES (675, 16, 'بزمان');
INSERT INTO "agahinet"."City" VALUES (676, 16, 'بمپور');
INSERT INTO "agahinet"."City" VALUES (677, 16, 'محمدان');
INSERT INTO "agahinet"."City" VALUES (678, 16, 'چابهار');
INSERT INTO "agahinet"."City" VALUES (679, 16, 'نگور');
INSERT INTO "agahinet"."City" VALUES (680, 16, 'خاش');
INSERT INTO "agahinet"."City" VALUES (681, 16, 'نوک آباد');
INSERT INTO "agahinet"."City" VALUES (682, 16, 'گلمورتی');
INSERT INTO "agahinet"."City" VALUES (683, 16, 'بنجار');
INSERT INTO "agahinet"."City" VALUES (684, 16, 'زابل');
INSERT INTO "agahinet"."City" VALUES (685, 16, 'زاهدان');
INSERT INTO "agahinet"."City" VALUES (686, 16, 'نصرت آباد');
INSERT INTO "agahinet"."City" VALUES (687, 16, 'زهک');
INSERT INTO "agahinet"."City" VALUES (688, 16, 'جالق');
INSERT INTO "agahinet"."City" VALUES (689, 16, 'سراوان');
INSERT INTO "agahinet"."City" VALUES (690, 16, 'سیرکان');
INSERT INTO "agahinet"."City" VALUES (691, 16, 'گشت');
INSERT INTO "agahinet"."City" VALUES (692, 16, 'محمدی');
INSERT INTO "agahinet"."City" VALUES (693, 16, 'پیشین');
INSERT INTO "agahinet"."City" VALUES (694, 16, 'راسک');
INSERT INTO "agahinet"."City" VALUES (695, 16, 'سرباز');
INSERT INTO "agahinet"."City" VALUES (696, 16, 'سوران');
INSERT INTO "agahinet"."City" VALUES (697, 16, 'هیدوچ');
INSERT INTO "agahinet"."City" VALUES (698, 16, 'فنوج');
INSERT INTO "agahinet"."City" VALUES (699, 16, 'قصرقند');
INSERT INTO "agahinet"."City" VALUES (700, 16, 'زرآباد');
INSERT INTO "agahinet"."City" VALUES (701, 16, 'کنارک');
INSERT INTO "agahinet"."City" VALUES (702, 16, 'مهرستان');
INSERT INTO "agahinet"."City" VALUES (703, 16, 'میرجاوه');
INSERT INTO "agahinet"."City" VALUES (704, 16, 'اسپکه');
INSERT INTO "agahinet"."City" VALUES (705, 16, 'بنت');
INSERT INTO "agahinet"."City" VALUES (706, 16, 'نیک شهر');
INSERT INTO "agahinet"."City" VALUES (707, 16, 'ادیمی');
INSERT INTO "agahinet"."City" VALUES (708, 16, 'شهرک علی اکبر');
INSERT INTO "agahinet"."City" VALUES (709, 16, 'محمدآباد');
INSERT INTO "agahinet"."City" VALUES (710, 16, 'دوست محمد');
INSERT INTO "agahinet"."City" VALUES (711, 17, 'آباده');
INSERT INTO "agahinet"."City" VALUES (712, 17, 'ایزدخواست');
INSERT INTO "agahinet"."City" VALUES (713, 17, 'بهمن');
INSERT INTO "agahinet"."City" VALUES (714, 17, 'سورمق');
INSERT INTO "agahinet"."City" VALUES (715, 17, 'صغاد');
INSERT INTO "agahinet"."City" VALUES (716, 17, 'ارسنجان');
INSERT INTO "agahinet"."City" VALUES (717, 17, 'استهبان');
INSERT INTO "agahinet"."City" VALUES (718, 17, 'ایج');
INSERT INTO "agahinet"."City" VALUES (719, 17, 'رونیز');
INSERT INTO "agahinet"."City" VALUES (720, 17, 'اقلید');
INSERT INTO "agahinet"."City" VALUES (721, 17, 'حسن اباد');
INSERT INTO "agahinet"."City" VALUES (722, 17, 'دژکرد');
INSERT INTO "agahinet"."City" VALUES (723, 17, 'سده');
INSERT INTO "agahinet"."City" VALUES (724, 17, 'بوانات');
INSERT INTO "agahinet"."City" VALUES (725, 17, 'حسامی');
INSERT INTO "agahinet"."City" VALUES (726, 17, 'کره ای');
INSERT INTO "agahinet"."City" VALUES (727, 17, 'مزایجان');
INSERT INTO "agahinet"."City" VALUES (728, 17, 'سعادت شهر');
INSERT INTO "agahinet"."City" VALUES (729, 17, 'مادرسلیمان');
INSERT INTO "agahinet"."City" VALUES (730, 17, 'باب انار');
INSERT INTO "agahinet"."City" VALUES (731, 17, 'جهرم');
INSERT INTO "agahinet"."City" VALUES (732, 17, 'خاوران');
INSERT INTO "agahinet"."City" VALUES (733, 17, 'دوزه');
INSERT INTO "agahinet"."City" VALUES (734, 17, 'قطب آباد');
INSERT INTO "agahinet"."City" VALUES (735, 17, 'خرامه');
INSERT INTO "agahinet"."City" VALUES (736, 17, 'سلطان شهر');
INSERT INTO "agahinet"."City" VALUES (737, 17, 'صفاشهر');
INSERT INTO "agahinet"."City" VALUES (738, 17, 'قادراباد');
INSERT INTO "agahinet"."City" VALUES (739, 17, 'خنج');
INSERT INTO "agahinet"."City" VALUES (740, 17, 'جنت شهر');
INSERT INTO "agahinet"."City" VALUES (741, 17, 'داراب');
INSERT INTO "agahinet"."City" VALUES (742, 17, 'دوبرجی');
INSERT INTO "agahinet"."City" VALUES (743, 17, 'فدامی');
INSERT INTO "agahinet"."City" VALUES (744, 17, 'کوپن');
INSERT INTO "agahinet"."City" VALUES (745, 17, 'مصیری');
INSERT INTO "agahinet"."City" VALUES (746, 17, 'حاجی آباد');
INSERT INTO "agahinet"."City" VALUES (747, 17, 'دبیران');
INSERT INTO "agahinet"."City" VALUES (748, 17, 'شهرپیر');
INSERT INTO "agahinet"."City" VALUES (749, 17, 'اردکان');
INSERT INTO "agahinet"."City" VALUES (750, 17, 'بیضا');
INSERT INTO "agahinet"."City" VALUES (751, 17, 'هماشهر');
INSERT INTO "agahinet"."City" VALUES (752, 17, 'سروستان');
INSERT INTO "agahinet"."City" VALUES (753, 17, 'کوهنجان');
INSERT INTO "agahinet"."City" VALUES (754, 17, 'خانه زنیان');
INSERT INTO "agahinet"."City" VALUES (755, 17, 'داریان');
INSERT INTO "agahinet"."City" VALUES (756, 17, 'زرقان');
INSERT INTO "agahinet"."City" VALUES (757, 17, 'شهرصدرا');
INSERT INTO "agahinet"."City" VALUES (758, 17, 'شیراز');
INSERT INTO "agahinet"."City" VALUES (759, 17, 'لپویی');
INSERT INTO "agahinet"."City" VALUES (760, 17, 'دهرم');
INSERT INTO "agahinet"."City" VALUES (761, 17, 'فراشبند');
INSERT INTO "agahinet"."City" VALUES (762, 17, 'نوجین');
INSERT INTO "agahinet"."City" VALUES (763, 17, 'زاهدشهر');
INSERT INTO "agahinet"."City" VALUES (764, 17, 'ششده');
INSERT INTO "agahinet"."City" VALUES (765, 17, 'فسا');
INSERT INTO "agahinet"."City" VALUES (766, 17, 'قره بلاغ');
INSERT INTO "agahinet"."City" VALUES (767, 17, 'میانشهر');
INSERT INTO "agahinet"."City" VALUES (768, 17, 'نوبندگان');
INSERT INTO "agahinet"."City" VALUES (769, 17, 'فیروزآباد');
INSERT INTO "agahinet"."City" VALUES (770, 17, 'میمند');
INSERT INTO "agahinet"."City" VALUES (771, 17, 'افزر');
INSERT INTO "agahinet"."City" VALUES (772, 17, 'امام شهر');
INSERT INTO "agahinet"."City" VALUES (773, 17, 'قیر');
INSERT INTO "agahinet"."City" VALUES (774, 17, 'کارزین (فتح آباد)');
INSERT INTO "agahinet"."City" VALUES (775, 17, 'مبارک آباددیز');
INSERT INTO "agahinet"."City" VALUES (776, 17, 'بالاده');
INSERT INTO "agahinet"."City" VALUES (777, 17, 'خشت');
INSERT INTO "agahinet"."City" VALUES (778, 17, 'قایمیه');
INSERT INTO "agahinet"."City" VALUES (779, 17, 'کازرون');
INSERT INTO "agahinet"."City" VALUES (780, 17, 'کنارتخته');
INSERT INTO "agahinet"."City" VALUES (781, 17, 'نودان');
INSERT INTO "agahinet"."City" VALUES (782, 17, 'کوار');
INSERT INTO "agahinet"."City" VALUES (783, 17, 'گراش');
INSERT INTO "agahinet"."City" VALUES (784, 17, 'اوز');
INSERT INTO "agahinet"."City" VALUES (785, 17, 'بنارویه');
INSERT INTO "agahinet"."City" VALUES (786, 17, 'بیرم');
INSERT INTO "agahinet"."City" VALUES (787, 17, 'جویم');
INSERT INTO "agahinet"."City" VALUES (788, 17, 'خور');
INSERT INTO "agahinet"."City" VALUES (789, 17, 'عمادده');
INSERT INTO "agahinet"."City" VALUES (790, 17, 'لار');
INSERT INTO "agahinet"."City" VALUES (791, 17, 'لطیفی');
INSERT INTO "agahinet"."City" VALUES (792, 17, 'اشکنان');
INSERT INTO "agahinet"."City" VALUES (793, 17, 'اهل');
INSERT INTO "agahinet"."City" VALUES (794, 17, 'علامرودشت');
INSERT INTO "agahinet"."City" VALUES (795, 17, 'لامرد');
INSERT INTO "agahinet"."City" VALUES (796, 17, 'خانیمن');
INSERT INTO "agahinet"."City" VALUES (797, 17, 'رامجرد');
INSERT INTO "agahinet"."City" VALUES (798, 17, 'سیدان');
INSERT INTO "agahinet"."City" VALUES (799, 17, 'کامفیروز');
INSERT INTO "agahinet"."City" VALUES (800, 17, 'مرودشت');
INSERT INTO "agahinet"."City" VALUES (801, 17, 'بابامنیر');
INSERT INTO "agahinet"."City" VALUES (802, 17, 'خومه زار');
INSERT INTO "agahinet"."City" VALUES (803, 17, 'نورآباد');
INSERT INTO "agahinet"."City" VALUES (804, 17, 'اسیر');
INSERT INTO "agahinet"."City" VALUES (805, 17, 'خوزی');
INSERT INTO "agahinet"."City" VALUES (806, 17, 'گله دار');
INSERT INTO "agahinet"."City" VALUES (807, 17, 'مهر');
INSERT INTO "agahinet"."City" VALUES (808, 17, 'وراوی');
INSERT INTO "agahinet"."City" VALUES (809, 17, 'آباده طشک');
INSERT INTO "agahinet"."City" VALUES (810, 17, 'قطرویه');
INSERT INTO "agahinet"."City" VALUES (811, 17, 'مشکان');
INSERT INTO "agahinet"."City" VALUES (812, 17, 'نی ریز');
INSERT INTO "agahinet"."City" VALUES (813, 18, 'آبیک');
INSERT INTO "agahinet"."City" VALUES (814, 18, 'خاکعلی');
INSERT INTO "agahinet"."City" VALUES (815, 18, 'آبگرم');
INSERT INTO "agahinet"."City" VALUES (816, 18, 'آوج');
INSERT INTO "agahinet"."City" VALUES (817, 18, 'الوند');
INSERT INTO "agahinet"."City" VALUES (818, 18, 'بیدستان');
INSERT INTO "agahinet"."City" VALUES (819, 18, 'شریفیه');
INSERT INTO "agahinet"."City" VALUES (820, 18, 'محمدیه');
INSERT INTO "agahinet"."City" VALUES (821, 18, 'ارداق');
INSERT INTO "agahinet"."City" VALUES (822, 18, 'بویین زهرا');
INSERT INTO "agahinet"."City" VALUES (823, 18, 'دانسفهان');
INSERT INTO "agahinet"."City" VALUES (824, 18, 'سگزآباد');
INSERT INTO "agahinet"."City" VALUES (825, 18, 'شال');
INSERT INTO "agahinet"."City" VALUES (826, 18, 'اسفرورین');
INSERT INTO "agahinet"."City" VALUES (827, 18, 'تاکستان');
INSERT INTO "agahinet"."City" VALUES (828, 18, 'خرمدشت');
INSERT INTO "agahinet"."City" VALUES (829, 18, 'ضیاڈآباد');
INSERT INTO "agahinet"."City" VALUES (830, 18, 'نرجه');
INSERT INTO "agahinet"."City" VALUES (831, 18, 'اقبالیه');
INSERT INTO "agahinet"."City" VALUES (832, 18, 'رازمیان');
INSERT INTO "agahinet"."City" VALUES (833, 18, 'سیردان');
INSERT INTO "agahinet"."City" VALUES (834, 18, 'قزوین');
INSERT INTO "agahinet"."City" VALUES (835, 18, 'کوهین');
INSERT INTO "agahinet"."City" VALUES (836, 18, 'محمودآبادنمونه');
INSERT INTO "agahinet"."City" VALUES (837, 18, 'معلم کلایه');
INSERT INTO "agahinet"."City" VALUES (838, 19, 'جعفریه');
INSERT INTO "agahinet"."City" VALUES (839, 19, 'دستجرد');
INSERT INTO "agahinet"."City" VALUES (840, 19, 'سلفچگان');
INSERT INTO "agahinet"."City" VALUES (841, 19, 'قم');
INSERT INTO "agahinet"."City" VALUES (842, 19, 'قنوات');
INSERT INTO "agahinet"."City" VALUES (843, 19, 'کهک');
INSERT INTO "agahinet"."City" VALUES (844, 20, 'آرمرده');
INSERT INTO "agahinet"."City" VALUES (845, 20, 'بانه');
INSERT INTO "agahinet"."City" VALUES (846, 20, 'بویین سفلی');
INSERT INTO "agahinet"."City" VALUES (847, 20, 'کانی سور');
INSERT INTO "agahinet"."City" VALUES (848, 20, 'بابارشانی');
INSERT INTO "agahinet"."City" VALUES (849, 20, 'بیجار');
INSERT INTO "agahinet"."City" VALUES (850, 20, 'پیرتاج');
INSERT INTO "agahinet"."City" VALUES (851, 20, 'توپ آغاج');
INSERT INTO "agahinet"."City" VALUES (852, 20, 'یاسوکند');
INSERT INTO "agahinet"."City" VALUES (853, 20, 'بلبان آباد');
INSERT INTO "agahinet"."City" VALUES (854, 20, 'دهگلان');
INSERT INTO "agahinet"."City" VALUES (855, 20, 'دیواندره');
INSERT INTO "agahinet"."City" VALUES (856, 20, 'زرینه');
INSERT INTO "agahinet"."City" VALUES (857, 20, 'اورامان تخت');
INSERT INTO "agahinet"."City" VALUES (858, 20, 'سروآباد');
INSERT INTO "agahinet"."City" VALUES (859, 20, 'سقز');
INSERT INTO "agahinet"."City" VALUES (860, 20, 'صاحب');
INSERT INTO "agahinet"."City" VALUES (861, 20, 'سنندج');
INSERT INTO "agahinet"."City" VALUES (862, 20, 'شویشه');
INSERT INTO "agahinet"."City" VALUES (863, 20, 'دزج');
INSERT INTO "agahinet"."City" VALUES (864, 20, 'دلبران');
INSERT INTO "agahinet"."City" VALUES (865, 20, 'سریش آباد');
INSERT INTO "agahinet"."City" VALUES (866, 20, 'قروه');
INSERT INTO "agahinet"."City" VALUES (867, 20, 'کامیاران');
INSERT INTO "agahinet"."City" VALUES (868, 20, 'موچش');
INSERT INTO "agahinet"."City" VALUES (869, 20, 'برده رشه');
INSERT INTO "agahinet"."City" VALUES (870, 20, 'چناره');
INSERT INTO "agahinet"."City" VALUES (871, 20, 'کانی دینار');
INSERT INTO "agahinet"."City" VALUES (872, 20, 'مریوان');
INSERT INTO "agahinet"."City" VALUES (873, 21, 'ارزوییه');
INSERT INTO "agahinet"."City" VALUES (874, 21, 'امین شهر');
INSERT INTO "agahinet"."City" VALUES (875, 21, 'انار');
INSERT INTO "agahinet"."City" VALUES (876, 21, 'بافت');
INSERT INTO "agahinet"."City" VALUES (877, 21, 'بزنجان');
INSERT INTO "agahinet"."City" VALUES (878, 21, 'بردسیر');
INSERT INTO "agahinet"."City" VALUES (879, 21, 'دشتکار');
INSERT INTO "agahinet"."City" VALUES (880, 21, 'گلزار');
INSERT INTO "agahinet"."City" VALUES (881, 21, 'لاله زار');
INSERT INTO "agahinet"."City" VALUES (882, 21, 'نگار');
INSERT INTO "agahinet"."City" VALUES (883, 21, 'بروات');
INSERT INTO "agahinet"."City" VALUES (884, 21, 'بم');
INSERT INTO "agahinet"."City" VALUES (885, 21, 'بلوک');
INSERT INTO "agahinet"."City" VALUES (886, 21, 'جبالبارز');
INSERT INTO "agahinet"."City" VALUES (887, 21, 'جیرفت');
INSERT INTO "agahinet"."City" VALUES (888, 21, 'درب بهشت');
INSERT INTO "agahinet"."City" VALUES (889, 21, 'رابر');
INSERT INTO "agahinet"."City" VALUES (890, 21, 'هنزا');
INSERT INTO "agahinet"."City" VALUES (891, 21, 'راور');
INSERT INTO "agahinet"."City" VALUES (892, 21, 'هجدک');
INSERT INTO "agahinet"."City" VALUES (893, 21, 'بهرمان');
INSERT INTO "agahinet"."City" VALUES (894, 21, 'رفسنجان');
INSERT INTO "agahinet"."City" VALUES (895, 21, 'صفاییه');
INSERT INTO "agahinet"."City" VALUES (896, 21, 'کشکوییه');
INSERT INTO "agahinet"."City" VALUES (897, 21, 'مس سرچشمه');
INSERT INTO "agahinet"."City" VALUES (898, 21, 'رودبار');
INSERT INTO "agahinet"."City" VALUES (899, 21, 'زهکلوت');
INSERT INTO "agahinet"."City" VALUES (900, 21, 'گنبکی');
INSERT INTO "agahinet"."City" VALUES (901, 21, 'محمدآباد');
INSERT INTO "agahinet"."City" VALUES (902, 21, 'خانوک');
INSERT INTO "agahinet"."City" VALUES (903, 21, 'ریحان');
INSERT INTO "agahinet"."City" VALUES (904, 21, 'زرند');
INSERT INTO "agahinet"."City" VALUES (905, 21, 'یزدان شهر');
INSERT INTO "agahinet"."City" VALUES (906, 21, 'بلورد');
INSERT INTO "agahinet"."City" VALUES (907, 21, 'پاریز');
INSERT INTO "agahinet"."City" VALUES (908, 21, 'خواجو شهر');
INSERT INTO "agahinet"."City" VALUES (909, 21, 'زیدآباد');
INSERT INTO "agahinet"."City" VALUES (910, 21, 'سیرجان');
INSERT INTO "agahinet"."City" VALUES (911, 21, 'نجف شهر');
INSERT INTO "agahinet"."City" VALUES (912, 21, 'هماشهر');
INSERT INTO "agahinet"."City" VALUES (913, 21, 'جوزم');
INSERT INTO "agahinet"."City" VALUES (914, 21, 'خاتون اباد');
INSERT INTO "agahinet"."City" VALUES (915, 21, 'خورسند');
INSERT INTO "agahinet"."City" VALUES (916, 21, 'دهج');
INSERT INTO "agahinet"."City" VALUES (917, 21, 'شهربابک');
INSERT INTO "agahinet"."City" VALUES (918, 21, 'دوساری');
INSERT INTO "agahinet"."City" VALUES (919, 21, 'عنبرآباد');
INSERT INTO "agahinet"."City" VALUES (920, 21, 'مردهک');
INSERT INTO "agahinet"."City" VALUES (921, 21, 'فاریاب');
INSERT INTO "agahinet"."City" VALUES (922, 21, 'فهرج');
INSERT INTO "agahinet"."City" VALUES (923, 21, 'قلعه گنج');
INSERT INTO "agahinet"."City" VALUES (924, 21, 'اختیارآباد');
INSERT INTO "agahinet"."City" VALUES (925, 21, 'اندوهجرد');
INSERT INTO "agahinet"."City" VALUES (926, 21, 'باغین');
INSERT INTO "agahinet"."City" VALUES (927, 21, 'جوپار');
INSERT INTO "agahinet"."City" VALUES (928, 21, 'چترود');
INSERT INTO "agahinet"."City" VALUES (929, 21, 'راین');
INSERT INTO "agahinet"."City" VALUES (930, 21, 'زنگی آباد');
INSERT INTO "agahinet"."City" VALUES (931, 21, 'شهداد');
INSERT INTO "agahinet"."City" VALUES (932, 21, 'کاظم آباد');
INSERT INTO "agahinet"."City" VALUES (933, 21, 'کرمان');
INSERT INTO "agahinet"."City" VALUES (934, 21, 'گلباف');
INSERT INTO "agahinet"."City" VALUES (935, 21, 'ماهان');
INSERT INTO "agahinet"."City" VALUES (936, 21, 'محی آباد');
INSERT INTO "agahinet"."City" VALUES (937, 21, 'کوهبنان');
INSERT INTO "agahinet"."City" VALUES (938, 21, 'کیانشهر');
INSERT INTO "agahinet"."City" VALUES (939, 21, 'کهنوج');
INSERT INTO "agahinet"."City" VALUES (940, 21, 'منوجان');
INSERT INTO "agahinet"."City" VALUES (941, 21, 'نودژ');
INSERT INTO "agahinet"."City" VALUES (942, 21, 'نرماشیر');
INSERT INTO "agahinet"."City" VALUES (943, 21, 'نظام شهر');
INSERT INTO "agahinet"."City" VALUES (944, 22, 'اسلام آبادغرب');
INSERT INTO "agahinet"."City" VALUES (945, 22, 'حمیل');
INSERT INTO "agahinet"."City" VALUES (946, 22, 'بانوره');
INSERT INTO "agahinet"."City" VALUES (947, 22, 'باینگان');
INSERT INTO "agahinet"."City" VALUES (948, 22, 'پاوه');
INSERT INTO "agahinet"."City" VALUES (949, 22, 'نودشه');
INSERT INTO "agahinet"."City" VALUES (950, 22, 'نوسود');
INSERT INTO "agahinet"."City" VALUES (951, 22, 'ازگله');
INSERT INTO "agahinet"."City" VALUES (952, 22, 'تازه آباد');
INSERT INTO "agahinet"."City" VALUES (953, 22, 'جوانرود');
INSERT INTO "agahinet"."City" VALUES (954, 22, 'ریجاب');
INSERT INTO "agahinet"."City" VALUES (955, 22, 'کرند');
INSERT INTO "agahinet"."City" VALUES (956, 22, 'گهواره');
INSERT INTO "agahinet"."City" VALUES (957, 22, 'روانسر');
INSERT INTO "agahinet"."City" VALUES (958, 22, 'شاهو');
INSERT INTO "agahinet"."City" VALUES (959, 22, 'سرپل ذهاب');
INSERT INTO "agahinet"."City" VALUES (960, 22, 'سطر');
INSERT INTO "agahinet"."City" VALUES (961, 22, 'سنقر');
INSERT INTO "agahinet"."City" VALUES (962, 22, 'صحنه');
INSERT INTO "agahinet"."City" VALUES (963, 22, 'میان راهان');
INSERT INTO "agahinet"."City" VALUES (964, 22, 'سومار');
INSERT INTO "agahinet"."City" VALUES (965, 22, 'قصرشیرین');
INSERT INTO "agahinet"."City" VALUES (966, 22, 'رباط');
INSERT INTO "agahinet"."City" VALUES (967, 22, 'کرمانشاه');
INSERT INTO "agahinet"."City" VALUES (968, 22, 'کوزران');
INSERT INTO "agahinet"."City" VALUES (969, 22, 'هلشی');
INSERT INTO "agahinet"."City" VALUES (970, 22, 'کنگاور');
INSERT INTO "agahinet"."City" VALUES (971, 22, 'گودین');
INSERT INTO "agahinet"."City" VALUES (972, 22, 'سرمست');
INSERT INTO "agahinet"."City" VALUES (973, 22, 'گیلانغرب');
INSERT INTO "agahinet"."City" VALUES (974, 22, 'بیستون');
INSERT INTO "agahinet"."City" VALUES (975, 22, 'هرسین');
INSERT INTO "agahinet"."City" VALUES (976, 23, 'باشت');
INSERT INTO "agahinet"."City" VALUES (977, 23, 'چیتاب');
INSERT INTO "agahinet"."City" VALUES (978, 23, 'گراب سفلی');
INSERT INTO "agahinet"."City" VALUES (979, 23, 'مادوان');
INSERT INTO "agahinet"."City" VALUES (980, 23, 'مارگون');
INSERT INTO "agahinet"."City" VALUES (981, 23, 'یاسوج');
INSERT INTO "agahinet"."City" VALUES (982, 23, 'لیکک');
INSERT INTO "agahinet"."City" VALUES (983, 23, 'چرام');
INSERT INTO "agahinet"."City" VALUES (984, 23, 'سرفاریاب');
INSERT INTO "agahinet"."City" VALUES (985, 23, 'پاتاوه');
INSERT INTO "agahinet"."City" VALUES (986, 23, 'سی سخت');
INSERT INTO "agahinet"."City" VALUES (987, 23, 'دهدشت');
INSERT INTO "agahinet"."City" VALUES (988, 23, 'دیشموک');
INSERT INTO "agahinet"."City" VALUES (989, 23, 'سوق');
INSERT INTO "agahinet"."City" VALUES (990, 23, 'قلعه رییسی');
INSERT INTO "agahinet"."City" VALUES (991, 23, 'دوگنبدان');
INSERT INTO "agahinet"."City" VALUES (992, 23, 'لنده');
INSERT INTO "agahinet"."City" VALUES (993, 24, 'آزادشهر');
INSERT INTO "agahinet"."City" VALUES (994, 24, 'نگین شهر');
INSERT INTO "agahinet"."City" VALUES (995, 24, 'نوده خاندوز');
INSERT INTO "agahinet"."City" VALUES (996, 24, 'آق قلا');
INSERT INTO "agahinet"."City" VALUES (997, 24, 'انبارآلوم');
INSERT INTO "agahinet"."City" VALUES (998, 24, 'بندرگز');
INSERT INTO "agahinet"."City" VALUES (999, 24, 'نوکنده');
INSERT INTO "agahinet"."City" VALUES (1000, 24, 'بندرترکمن');
INSERT INTO "agahinet"."City" VALUES (1001, 24, 'تاتارعلیا');
INSERT INTO "agahinet"."City" VALUES (1002, 24, 'خان ببین');
INSERT INTO "agahinet"."City" VALUES (1003, 24, 'دلند');
INSERT INTO "agahinet"."City" VALUES (1004, 24, 'رامیان');
INSERT INTO "agahinet"."City" VALUES (1005, 24, 'سنگدوین');
INSERT INTO "agahinet"."City" VALUES (1006, 24, 'علی اباد');
INSERT INTO "agahinet"."City" VALUES (1007, 24, 'فاضل آباد');
INSERT INTO "agahinet"."City" VALUES (1008, 24, 'مزرعه');
INSERT INTO "agahinet"."City" VALUES (1009, 24, 'کردکوی');
INSERT INTO "agahinet"."City" VALUES (1010, 24, 'فراغی');
INSERT INTO "agahinet"."City" VALUES (1011, 24, 'کلاله');
INSERT INTO "agahinet"."City" VALUES (1012, 24, 'گالیکش');
INSERT INTO "agahinet"."City" VALUES (1013, 24, 'جلین');
INSERT INTO "agahinet"."City" VALUES (1014, 24, 'سرخنکلاته');
INSERT INTO "agahinet"."City" VALUES (1015, 24, 'گرگان');
INSERT INTO "agahinet"."City" VALUES (1016, 24, 'سیمین شهر');
INSERT INTO "agahinet"."City" VALUES (1017, 24, 'گمیش تپه');
INSERT INTO "agahinet"."City" VALUES (1018, 24, 'اینچه برون');
INSERT INTO "agahinet"."City" VALUES (1019, 24, 'گنبدکاووس');
INSERT INTO "agahinet"."City" VALUES (1020, 24, 'مراوه');
INSERT INTO "agahinet"."City" VALUES (1021, 24, 'مینودشت');
INSERT INTO "agahinet"."City" VALUES (1022, 25, 'آستارا');
INSERT INTO "agahinet"."City" VALUES (1023, 25, 'لوندویل');
INSERT INTO "agahinet"."City" VALUES (1024, 25, 'آستانه اشرفیه');
INSERT INTO "agahinet"."City" VALUES (1025, 25, 'کیاشهر');
INSERT INTO "agahinet"."City" VALUES (1026, 25, 'املش');
INSERT INTO "agahinet"."City" VALUES (1027, 25, 'رانکوه');
INSERT INTO "agahinet"."City" VALUES (1028, 25, 'بندرانزلی');
INSERT INTO "agahinet"."City" VALUES (1029, 25, 'خشکبیجار');
INSERT INTO "agahinet"."City" VALUES (1030, 25, 'خمام');
INSERT INTO "agahinet"."City" VALUES (1031, 25, 'رشت');
INSERT INTO "agahinet"."City" VALUES (1032, 25, 'سنگر');
INSERT INTO "agahinet"."City" VALUES (1033, 25, 'کوچصفهان');
INSERT INTO "agahinet"."City" VALUES (1034, 25, 'لشت نشاء');
INSERT INTO "agahinet"."City" VALUES (1035, 25, 'لولمان');
INSERT INTO "agahinet"."City" VALUES (1036, 25, 'پره سر');
INSERT INTO "agahinet"."City" VALUES (1037, 25, 'رضوانشهر');
INSERT INTO "agahinet"."City" VALUES (1038, 25, 'بره سر');
INSERT INTO "agahinet"."City" VALUES (1039, 25, 'توتکابن');
INSERT INTO "agahinet"."City" VALUES (1040, 25, 'جیرنده');
INSERT INTO "agahinet"."City" VALUES (1041, 25, 'رستم آباد');
INSERT INTO "agahinet"."City" VALUES (1042, 25, 'رودبار');
INSERT INTO "agahinet"."City" VALUES (1043, 25, 'لوشان');
INSERT INTO "agahinet"."City" VALUES (1044, 25, 'منجیل');
INSERT INTO "agahinet"."City" VALUES (1045, 25, 'چابکسر');
INSERT INTO "agahinet"."City" VALUES (1046, 25, 'رحیم آباد');
INSERT INTO "agahinet"."City" VALUES (1047, 25, 'رودسر');
INSERT INTO "agahinet"."City" VALUES (1048, 25, 'کلاچای');
INSERT INTO "agahinet"."City" VALUES (1049, 25, 'واجارگاه');
INSERT INTO "agahinet"."City" VALUES (1050, 25, 'دیلمان');
INSERT INTO "agahinet"."City" VALUES (1051, 25, 'سیاهکل');
INSERT INTO "agahinet"."City" VALUES (1052, 25, 'احمدسرگوراب');
INSERT INTO "agahinet"."City" VALUES (1053, 25, 'شفت');
INSERT INTO "agahinet"."City" VALUES (1054, 25, 'صومعه سرا');
INSERT INTO "agahinet"."City" VALUES (1055, 25, 'گوراب زرمیخ');
INSERT INTO "agahinet"."City" VALUES (1056, 25, 'مرجقل');
INSERT INTO "agahinet"."City" VALUES (1057, 25, 'اسالم');
INSERT INTO "agahinet"."City" VALUES (1058, 25, 'چوبر');
INSERT INTO "agahinet"."City" VALUES (1059, 25, 'حویق');
INSERT INTO "agahinet"."City" VALUES (1060, 25, 'لیسار');
INSERT INTO "agahinet"."City" VALUES (1061, 25, 'هشتپر (تالش)');
INSERT INTO "agahinet"."City" VALUES (1062, 25, 'فومن');
INSERT INTO "agahinet"."City" VALUES (1063, 25, 'ماسوله');
INSERT INTO "agahinet"."City" VALUES (1064, 25, 'ماکلوان');
INSERT INTO "agahinet"."City" VALUES (1065, 25, 'رودبنه');
INSERT INTO "agahinet"."City" VALUES (1066, 25, 'لاهیجان');
INSERT INTO "agahinet"."City" VALUES (1067, 25, 'اطاقور');
INSERT INTO "agahinet"."City" VALUES (1068, 25, 'چاف و چمخاله');
INSERT INTO "agahinet"."City" VALUES (1069, 25, 'شلمان');
INSERT INTO "agahinet"."City" VALUES (1070, 25, 'کومله');
INSERT INTO "agahinet"."City" VALUES (1071, 25, 'لنگرود');
INSERT INTO "agahinet"."City" VALUES (1072, 25, 'بازار جمعه');
INSERT INTO "agahinet"."City" VALUES (1073, 25, 'ماسال');
INSERT INTO "agahinet"."City" VALUES (1074, 26, 'ازنا');
INSERT INTO "agahinet"."City" VALUES (1075, 26, 'مومن آباد');
INSERT INTO "agahinet"."City" VALUES (1076, 26, 'الیگودرز');
INSERT INTO "agahinet"."City" VALUES (1077, 26, 'شول آباد');
INSERT INTO "agahinet"."City" VALUES (1078, 26, 'اشترینان');
INSERT INTO "agahinet"."City" VALUES (1079, 26, 'بروجرد');
INSERT INTO "agahinet"."City" VALUES (1080, 26, 'پلدختر');
INSERT INTO "agahinet"."City" VALUES (1081, 26, 'معمولان');
INSERT INTO "agahinet"."City" VALUES (1082, 26, 'بیران شهر');
INSERT INTO "agahinet"."City" VALUES (1083, 26, 'خرم آباد');
INSERT INTO "agahinet"."City" VALUES (1084, 26, 'زاغه');
INSERT INTO "agahinet"."City" VALUES (1085, 26, 'سپیددشت');
INSERT INTO "agahinet"."City" VALUES (1086, 26, 'نورآباد');
INSERT INTO "agahinet"."City" VALUES (1087, 26, 'هفت چشمه');
INSERT INTO "agahinet"."City" VALUES (1088, 26, 'چالانچولان');
INSERT INTO "agahinet"."City" VALUES (1089, 26, 'دورود');
INSERT INTO "agahinet"."City" VALUES (1090, 26, 'سراب دوره');
INSERT INTO "agahinet"."City" VALUES (1091, 26, 'ویسیان');
INSERT INTO "agahinet"."City" VALUES (1092, 26, 'چقابل');
INSERT INTO "agahinet"."City" VALUES (1093, 26, 'الشتر');
INSERT INTO "agahinet"."City" VALUES (1094, 26, 'فیروزآباد');
INSERT INTO "agahinet"."City" VALUES (1095, 26, 'درب گنبد');
INSERT INTO "agahinet"."City" VALUES (1096, 26, 'کوهدشت');
INSERT INTO "agahinet"."City" VALUES (1097, 26, 'کوهنانی');
INSERT INTO "agahinet"."City" VALUES (1098, 26, 'گراب');
INSERT INTO "agahinet"."City" VALUES (1099, 27, 'آمل');
INSERT INTO "agahinet"."City" VALUES (1100, 27, 'امامزاده عبدالله');
INSERT INTO "agahinet"."City" VALUES (1101, 27, 'دابودشت');
INSERT INTO "agahinet"."City" VALUES (1102, 27, 'رینه');
INSERT INTO "agahinet"."City" VALUES (1103, 27, 'گزنک');
INSERT INTO "agahinet"."City" VALUES (1104, 27, 'امیرکلا');
INSERT INTO "agahinet"."City" VALUES (1105, 27, 'بابل');
INSERT INTO "agahinet"."City" VALUES (1106, 27, 'خوش رودپی');
INSERT INTO "agahinet"."City" VALUES (1107, 27, 'زرگرمحله');
INSERT INTO "agahinet"."City" VALUES (1108, 27, 'گتاب');
INSERT INTO "agahinet"."City" VALUES (1109, 27, 'گلوگاه');
INSERT INTO "agahinet"."City" VALUES (1110, 27, 'مرزیکلا');
INSERT INTO "agahinet"."City" VALUES (1111, 27, 'بابلسر');
INSERT INTO "agahinet"."City" VALUES (1112, 27, 'بهنمیر');
INSERT INTO "agahinet"."City" VALUES (1113, 27, 'هادی شهر');
INSERT INTO "agahinet"."City" VALUES (1114, 27, 'بهشهر');
INSERT INTO "agahinet"."City" VALUES (1115, 27, 'خلیل شهر');
INSERT INTO "agahinet"."City" VALUES (1116, 27, 'رستمکلا');
INSERT INTO "agahinet"."City" VALUES (1117, 27, 'تنکابن');
INSERT INTO "agahinet"."City" VALUES (1118, 27, 'خرم آباد');
INSERT INTO "agahinet"."City" VALUES (1119, 27, 'شیرود');
INSERT INTO "agahinet"."City" VALUES (1120, 27, 'نشتارود');
INSERT INTO "agahinet"."City" VALUES (1121, 27, 'جویبار');
INSERT INTO "agahinet"."City" VALUES (1122, 27, 'کوهی خیل');
INSERT INTO "agahinet"."City" VALUES (1123, 27, 'چالوس');
INSERT INTO "agahinet"."City" VALUES (1124, 27, 'مرزن آباد');
INSERT INTO "agahinet"."City" VALUES (1125, 27, 'هچیرود');
INSERT INTO "agahinet"."City" VALUES (1126, 27, 'رامسر');
INSERT INTO "agahinet"."City" VALUES (1127, 27, 'کتالم وسادات شهر');
INSERT INTO "agahinet"."City" VALUES (1128, 27, 'پایین هولار');
INSERT INTO "agahinet"."City" VALUES (1129, 27, 'ساری');
INSERT INTO "agahinet"."City" VALUES (1130, 27, 'فریم');
INSERT INTO "agahinet"."City" VALUES (1131, 27, 'کیاسر');
INSERT INTO "agahinet"."City" VALUES (1132, 27, 'آلاشت');
INSERT INTO "agahinet"."City" VALUES (1133, 27, 'پل سفید');
INSERT INTO "agahinet"."City" VALUES (1134, 27, 'زیرآب');
INSERT INTO "agahinet"."City" VALUES (1135, 27, 'شیرگاه');
INSERT INTO "agahinet"."City" VALUES (1136, 27, 'کیاکلا');
INSERT INTO "agahinet"."City" VALUES (1137, 27, 'سلمان شهر');
INSERT INTO "agahinet"."City" VALUES (1138, 27, 'عباس اباد');
INSERT INTO "agahinet"."City" VALUES (1139, 27, 'کلارآباد');
INSERT INTO "agahinet"."City" VALUES (1140, 27, 'فریدونکنار');
INSERT INTO "agahinet"."City" VALUES (1141, 27, 'ارطه');
INSERT INTO "agahinet"."City" VALUES (1142, 27, 'قایم شهر');
INSERT INTO "agahinet"."City" VALUES (1143, 27, 'کلاردشت');
INSERT INTO "agahinet"."City" VALUES (1144, 27, 'گلوگاه');
INSERT INTO "agahinet"."City" VALUES (1145, 27, 'سرخرود');
INSERT INTO "agahinet"."City" VALUES (1146, 27, 'محمودآباد');
INSERT INTO "agahinet"."City" VALUES (1147, 27, 'سورک');
INSERT INTO "agahinet"."City" VALUES (1148, 27, 'نکا');
INSERT INTO "agahinet"."City" VALUES (1149, 27, 'ایزدشهر');
INSERT INTO "agahinet"."City" VALUES (1150, 27, 'بلده');
INSERT INTO "agahinet"."City" VALUES (1151, 27, 'چمستان');
INSERT INTO "agahinet"."City" VALUES (1152, 27, 'رویان');
INSERT INTO "agahinet"."City" VALUES (1153, 27, 'نور');
INSERT INTO "agahinet"."City" VALUES (1154, 27, 'پول');
INSERT INTO "agahinet"."City" VALUES (1155, 27, 'کجور');
INSERT INTO "agahinet"."City" VALUES (1156, 27, 'نوشهر');
INSERT INTO "agahinet"."City" VALUES (1157, 28, 'آشتیان');
INSERT INTO "agahinet"."City" VALUES (1158, 28, 'اراک');
INSERT INTO "agahinet"."City" VALUES (1159, 28, 'داودآباد');
INSERT INTO "agahinet"."City" VALUES (1160, 28, 'ساروق');
INSERT INTO "agahinet"."City" VALUES (1161, 28, 'کارچان');
INSERT INTO "agahinet"."City" VALUES (1162, 28, 'تفرش');
INSERT INTO "agahinet"."City" VALUES (1163, 28, 'خمین');
INSERT INTO "agahinet"."City" VALUES (1164, 28, 'قورچی باشی');
INSERT INTO "agahinet"."City" VALUES (1165, 28, 'جاورسیان');
INSERT INTO "agahinet"."City" VALUES (1166, 28, 'خنداب');
INSERT INTO "agahinet"."City" VALUES (1167, 28, 'دلیجان');
INSERT INTO "agahinet"."City" VALUES (1168, 28, 'نراق');
INSERT INTO "agahinet"."City" VALUES (1169, 28, 'پرندک');
INSERT INTO "agahinet"."City" VALUES (1170, 28, 'خشکرود');
INSERT INTO "agahinet"."City" VALUES (1171, 28, 'رازقان');
INSERT INTO "agahinet"."City" VALUES (1172, 28, 'زاویه');
INSERT INTO "agahinet"."City" VALUES (1173, 28, 'مامونیه');
INSERT INTO "agahinet"."City" VALUES (1174, 28, 'آوه');
INSERT INTO "agahinet"."City" VALUES (1175, 28, 'ساوه');
INSERT INTO "agahinet"."City" VALUES (1176, 28, 'غرق آباد');
INSERT INTO "agahinet"."City" VALUES (1177, 28, 'نوبران');
INSERT INTO "agahinet"."City" VALUES (1178, 28, 'آستانه');
INSERT INTO "agahinet"."City" VALUES (1179, 28, 'توره');
INSERT INTO "agahinet"."City" VALUES (1180, 28, 'شازند');
INSERT INTO "agahinet"."City" VALUES (1181, 28, 'شهباز');
INSERT INTO "agahinet"."City" VALUES (1182, 28, 'مهاجران');
INSERT INTO "agahinet"."City" VALUES (1183, 28, 'هندودر');
INSERT INTO "agahinet"."City" VALUES (1184, 28, 'خنجین');
INSERT INTO "agahinet"."City" VALUES (1185, 28, 'فرمهین');
INSERT INTO "agahinet"."City" VALUES (1186, 28, 'کمیجان');
INSERT INTO "agahinet"."City" VALUES (1187, 28, 'میلاجرد');
INSERT INTO "agahinet"."City" VALUES (1188, 28, 'محلات');
INSERT INTO "agahinet"."City" VALUES (1189, 28, 'نیمور');
INSERT INTO "agahinet"."City" VALUES (1190, 29, 'ابوموسی');
INSERT INTO "agahinet"."City" VALUES (1191, 29, 'بستک');
INSERT INTO "agahinet"."City" VALUES (1192, 29, 'جناح');
INSERT INTO "agahinet"."City" VALUES (1193, 29, 'سردشت');
INSERT INTO "agahinet"."City" VALUES (1194, 29, 'گوهران');
INSERT INTO "agahinet"."City" VALUES (1195, 29, 'بندرعباس');
INSERT INTO "agahinet"."City" VALUES (1196, 29, 'تازیان پایین');
INSERT INTO "agahinet"."City" VALUES (1197, 29, 'تخت');
INSERT INTO "agahinet"."City" VALUES (1198, 29, 'فین');
INSERT INTO "agahinet"."City" VALUES (1199, 29, 'قلعه قاضی');
INSERT INTO "agahinet"."City" VALUES (1200, 29, 'بندرلنگه');
INSERT INTO "agahinet"."City" VALUES (1201, 29, 'چارک');
INSERT INTO "agahinet"."City" VALUES (1202, 29, 'کنگ');
INSERT INTO "agahinet"."City" VALUES (1203, 29, 'کیش');
INSERT INTO "agahinet"."City" VALUES (1204, 29, 'لمزان');
INSERT INTO "agahinet"."City" VALUES (1205, 29, 'پارسیان');
INSERT INTO "agahinet"."City" VALUES (1206, 29, 'دشتی');
INSERT INTO "agahinet"."City" VALUES (1207, 29, 'کوشکنار');
INSERT INTO "agahinet"."City" VALUES (1208, 29, 'بندرجاسک');
INSERT INTO "agahinet"."City" VALUES (1209, 29, 'حاجی اباد');
INSERT INTO "agahinet"."City" VALUES (1210, 29, 'سرگز');
INSERT INTO "agahinet"."City" VALUES (1211, 29, 'فارغان');
INSERT INTO "agahinet"."City" VALUES (1212, 29, 'خمیر');
INSERT INTO "agahinet"."City" VALUES (1213, 29, 'رویدر');
INSERT INTO "agahinet"."City" VALUES (1214, 29, 'بیکاء');
INSERT INTO "agahinet"."City" VALUES (1215, 29, 'دهبارز');
INSERT INTO "agahinet"."City" VALUES (1216, 29, 'زیارتعلی');
INSERT INTO "agahinet"."City" VALUES (1217, 29, 'سیریک');
INSERT INTO "agahinet"."City" VALUES (1218, 29, 'کوهستک');
INSERT INTO "agahinet"."City" VALUES (1219, 29, 'گروک');
INSERT INTO "agahinet"."City" VALUES (1220, 29, 'درگهان');
INSERT INTO "agahinet"."City" VALUES (1221, 29, 'سوزا');
INSERT INTO "agahinet"."City" VALUES (1222, 29, 'قشم');
INSERT INTO "agahinet"."City" VALUES (1223, 29, 'هرمز');
INSERT INTO "agahinet"."City" VALUES (1224, 29, 'تیرور');
INSERT INTO "agahinet"."City" VALUES (1225, 29, 'سندرک');
INSERT INTO "agahinet"."City" VALUES (1226, 29, 'میناب');
INSERT INTO "agahinet"."City" VALUES (1227, 29, 'هشتبندی');
INSERT INTO "agahinet"."City" VALUES (1228, 30, 'آجین');
INSERT INTO "agahinet"."City" VALUES (1229, 30, 'اسدآباد');
INSERT INTO "agahinet"."City" VALUES (1230, 30, 'بهار');
INSERT INTO "agahinet"."City" VALUES (1231, 30, 'صالح آباد');
INSERT INTO "agahinet"."City" VALUES (1232, 30, 'لالجین');
INSERT INTO "agahinet"."City" VALUES (1233, 30, 'مهاجران');
INSERT INTO "agahinet"."City" VALUES (1234, 30, 'تویسرکان');
INSERT INTO "agahinet"."City" VALUES (1235, 30, 'سرکان');
INSERT INTO "agahinet"."City" VALUES (1236, 30, 'فرسفج');
INSERT INTO "agahinet"."City" VALUES (1237, 30, 'دمق');
INSERT INTO "agahinet"."City" VALUES (1238, 30, 'رزن');
INSERT INTO "agahinet"."City" VALUES (1239, 30, 'قروه درجزین');
INSERT INTO "agahinet"."City" VALUES (1240, 30, 'فامنین');
INSERT INTO "agahinet"."City" VALUES (1241, 30, 'شیرین سو');
INSERT INTO "agahinet"."City" VALUES (1242, 30, 'کبودرآهنگ');
INSERT INTO "agahinet"."City" VALUES (1243, 30, 'گل تپه');
INSERT INTO "agahinet"."City" VALUES (1244, 30, 'ازندریان');
INSERT INTO "agahinet"."City" VALUES (1245, 30, 'جوکار');
INSERT INTO "agahinet"."City" VALUES (1246, 30, 'زنگنه');
INSERT INTO "agahinet"."City" VALUES (1247, 30, 'سامن');
INSERT INTO "agahinet"."City" VALUES (1248, 30, 'ملایر');
INSERT INTO "agahinet"."City" VALUES (1249, 30, 'برزول');
INSERT INTO "agahinet"."City" VALUES (1250, 30, 'فیروزان');
INSERT INTO "agahinet"."City" VALUES (1251, 30, 'گیان');
INSERT INTO "agahinet"."City" VALUES (1252, 30, 'نهاوند');
INSERT INTO "agahinet"."City" VALUES (1253, 30, 'جورقان');
INSERT INTO "agahinet"."City" VALUES (1254, 30, 'قهاوند');
INSERT INTO "agahinet"."City" VALUES (1255, 30, 'مریانج');
INSERT INTO "agahinet"."City" VALUES (1256, 30, 'همدان');
INSERT INTO "agahinet"."City" VALUES (1257, 18, 'خوزنين');
INSERT INTO "agahinet"."City" VALUES (1258, 31, 'ابرکوه');
INSERT INTO "agahinet"."City" VALUES (1259, 31, 'مهردشت');
INSERT INTO "agahinet"."City" VALUES (1260, 31, 'احمدآباد');
INSERT INTO "agahinet"."City" VALUES (1261, 31, 'اردکان');
INSERT INTO "agahinet"."City" VALUES (1262, 31, 'عقدا');
INSERT INTO "agahinet"."City" VALUES (1263, 31, 'اشکذر');
INSERT INTO "agahinet"."City" VALUES (1264, 31, 'خضرآباد');
INSERT INTO "agahinet"."City" VALUES (1265, 31, 'بافق');
INSERT INTO "agahinet"."City" VALUES (1266, 31, 'بهاباد');
INSERT INTO "agahinet"."City" VALUES (1267, 31, 'تفت');
INSERT INTO "agahinet"."City" VALUES (1268, 31, 'نیر');
INSERT INTO "agahinet"."City" VALUES (1269, 31, 'مروست');
INSERT INTO "agahinet"."City" VALUES (1270, 31, 'هرات');
INSERT INTO "agahinet"."City" VALUES (1271, 31, 'مهریز');
INSERT INTO "agahinet"."City" VALUES (1272, 31, 'بفروییه');
INSERT INTO "agahinet"."City" VALUES (1273, 31, 'میبد');
INSERT INTO "agahinet"."City" VALUES (1274, 31, 'ندوشن');
INSERT INTO "agahinet"."City" VALUES (1275, 31, 'حمیدیا');
INSERT INTO "agahinet"."City" VALUES (1276, 31, 'زارچ');
INSERT INTO "agahinet"."City" VALUES (1277, 31, 'شاهدیه');
INSERT INTO "agahinet"."City" VALUES (1278, 31, 'یزد');

-- ----------------------------
-- Table structure for Image
-- ----------------------------
DROP TABLE IF EXISTS "agahinet"."Image";
CREATE TABLE "agahinet"."Image" (
  "image_id" int8 NOT NULL DEFAULT nextval('"agahinet"."Image_image_id_seq"'::regclass),
  "url" text COLLATE "pg_catalog"."default" NOT NULL,
  "ad_id" int8
)
;


-- ----------------------------
-- Table structure for Message
-- ----------------------------
DROP TABLE IF EXISTS "agahinet"."Message";
CREATE TABLE "agahinet"."Message" (
  "mid" int8 NOT NULL DEFAULT nextval('"agahinet".message_mid_seq'::regclass),
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
DROP TABLE IF EXISTS "agahinet"."User";
CREATE TABLE "agahinet"."User" (
  "uid" int4 NOT NULL DEFAULT nextval('"agahinet".user_uid_seq'::regclass),
  "fullname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT now(),
  "password" text COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "is_active" bool NOT NULL DEFAULT false,
  "phone_number" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Primary Key structure for table Ad
-- ----------------------------
ALTER TABLE "agahinet"."Ad" ADD CONSTRAINT "Ad_pkey" PRIMARY KEY ("ad_id");

-- ----------------------------
-- Primary Key structure for table Bookmark
-- ----------------------------
ALTER TABLE "agahinet"."Bookmark" ADD CONSTRAINT "Bookmark_pkey" PRIMARY KEY ("uid", "ad_id");

-- ----------------------------
-- Primary Key structure for table Category
-- ----------------------------
ALTER TABLE "agahinet"."Category" ADD CONSTRAINT "Category_pkey" PRIMARY KEY ("cat_id");

-- ----------------------------
-- Primary Key structure for table City
-- ----------------------------
ALTER TABLE "agahinet"."City" ADD CONSTRAINT "City_pkey" PRIMARY KEY ("city_id");

-- ----------------------------
-- Primary Key structure for table Image
-- ----------------------------
ALTER TABLE "agahinet"."Image" ADD CONSTRAINT "Image_pkey" PRIMARY KEY ("image_id");

-- ----------------------------
-- Primary Key structure for table Message
-- ----------------------------
ALTER TABLE "agahinet"."Message" ADD CONSTRAINT "message_pkey" PRIMARY KEY ("mid");

-- ----------------------------
-- Uniques structure for table User
-- ----------------------------
ALTER TABLE "agahinet"."User" ADD CONSTRAINT "u_email" UNIQUE ("email");

-- ----------------------------
-- Primary Key structure for table User
-- ----------------------------
ALTER TABLE "agahinet"."User" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("uid");

-- ----------------------------
-- Foreign Keys structure for table Ad
-- ----------------------------
ALTER TABLE "agahinet"."Ad" ADD CONSTRAINT "category_fk" FOREIGN KEY ("category") REFERENCES "agahinet"."Category" ("cat_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "agahinet"."Ad" ADD CONSTRAINT "city_fk" FOREIGN KEY ("city") REFERENCES "agahinet"."City" ("city_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "agahinet"."Ad" ADD CONSTRAINT "creator_fk" FOREIGN KEY ("creator") REFERENCES "agahinet"."User" ("uid") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "agahinet"."Ad" ADD CONSTRAINT "main_image_fk" FOREIGN KEY ("main_image_id") REFERENCES "agahinet"."Image" ("image_id") ON DELETE SET NULL ON UPDATE SET NULL;

-- ----------------------------
-- Foreign Keys structure for table Bookmark
-- ----------------------------
ALTER TABLE "agahinet"."Bookmark" ADD CONSTRAINT "ad_id_fk" FOREIGN KEY ("ad_id") REFERENCES "agahinet"."Ad" ("ad_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "agahinet"."Bookmark" ADD CONSTRAINT "uid_fk" FOREIGN KEY ("uid") REFERENCES "agahinet"."User" ("uid") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Category
-- ----------------------------
ALTER TABLE "agahinet"."Category" ADD CONSTRAINT "parent_fk" FOREIGN KEY ("parent_id") REFERENCES "agahinet"."Category" ("cat_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table City
-- ----------------------------
ALTER TABLE "agahinet"."City" ADD CONSTRAINT "sub_fk" FOREIGN KEY ("sub") REFERENCES "agahinet"."City" ("city_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table Image
-- ----------------------------
ALTER TABLE "agahinet"."Image" ADD CONSTRAINT "ad_id_fk" FOREIGN KEY ("ad_id") REFERENCES "agahinet"."Ad" ("ad_id") ON DELETE SET NULL ON UPDATE SET NULL;

-- ----------------------------
-- Foreign Keys structure for table Message
-- ----------------------------
ALTER TABLE "agahinet"."Message" ADD CONSTRAINT "creator_fk" FOREIGN KEY ("creator_id") REFERENCES "agahinet"."User" ("uid") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "agahinet"."Message" ADD CONSTRAINT "recipient_fk" FOREIGN KEY ("recipient_id") REFERENCES "agahinet"."User" ("uid") ON DELETE CASCADE ON UPDATE CASCADE;
