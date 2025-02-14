PGDMP                          z         	   db_course    14.2    14.2 6    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    18716 	   db_course    DATABASE     T   CREATE DATABASE db_course WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE db_course;
                postgres    false            �            1259    18728    category    TABLE     �   CREATE TABLE public.category (
    id integer NOT NULL,
    public_id character varying NOT NULL,
    name_category character varying(100),
    "desc" text
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    18727    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    212            9           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    211            �            1259    18752    course    TABLE     �   CREATE TABLE public.course (
    id integer NOT NULL,
    public_id character varying NOT NULL,
    name_course character varying(100),
    "desc" text,
    category_id integer NOT NULL
);
    DROP TABLE public.course;
       public         heap    postgres    false            �            1259    18751    course_id_seq    SEQUENCE     �   CREATE SEQUENCE public.course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.course_id_seq;
       public          postgres    false    216            :           0    0    course_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.course_id_seq OWNED BY public.course.id;
          public          postgres    false    215            �            1259    18782    enroll    TABLE     �   CREATE TABLE public.enroll (
    id integer NOT NULL,
    public_id character varying NOT NULL,
    date_enroll date,
    course_id integer NOT NULL,
    user_id integer NOT NULL,
    is_complete boolean NOT NULL
);
    DROP TABLE public.enroll;
       public         heap    postgres    false            �            1259    18781    enroll_id_seq    SEQUENCE     �   CREATE SEQUENCE public.enroll_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.enroll_id_seq;
       public          postgres    false    219            ;           0    0    enroll_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.enroll_id_seq OWNED BY public.enroll.id;
          public          postgres    false    218            �            1259    18766 
   ins_course    TABLE     h   CREATE TABLE public.ins_course (
    course_id integer NOT NULL,
    instructors_id integer NOT NULL
);
    DROP TABLE public.ins_course;
       public         heap    postgres    false            �            1259    18718    instructors    TABLE     �   CREATE TABLE public.instructors (
    id integer NOT NULL,
    public_id character varying NOT NULL,
    name_instructors character varying(100)
);
    DROP TABLE public.instructors;
       public         heap    postgres    false            �            1259    18717    instructors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.instructors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.instructors_id_seq;
       public          postgres    false    210            <           0    0    instructors_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.instructors_id_seq OWNED BY public.instructors.id;
          public          postgres    false    209            �            1259    18738    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    public_id character varying NOT NULL,
    name character varying(30) NOT NULL,
    username character varying(10) NOT NULL,
    password character varying(10) NOT NULL,
    is_admin boolean
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    18737    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    214            =           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    213                       2604    18731    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    18755 	   course id    DEFAULT     f   ALTER TABLE ONLY public.course ALTER COLUMN id SET DEFAULT nextval('public.course_id_seq'::regclass);
 8   ALTER TABLE public.course ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            �           2604    18785 	   enroll id    DEFAULT     f   ALTER TABLE ONLY public.enroll ALTER COLUMN id SET DEFAULT nextval('public.enroll_id_seq'::regclass);
 8   ALTER TABLE public.enroll ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            ~           2604    18721    instructors id    DEFAULT     p   ALTER TABLE ONLY public.instructors ALTER COLUMN id SET DEFAULT nextval('public.instructors_id_seq'::regclass);
 =   ALTER TABLE public.instructors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    18741    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            +          0    18728    category 
   TABLE DATA           H   COPY public.category (id, public_id, name_category, "desc") FROM stdin;
    public          postgres    false    212   �:       /          0    18752    course 
   TABLE DATA           Q   COPY public.course (id, public_id, name_course, "desc", category_id) FROM stdin;
    public          postgres    false    216   �;       2          0    18782    enroll 
   TABLE DATA           ]   COPY public.enroll (id, public_id, date_enroll, course_id, user_id, is_complete) FROM stdin;
    public          postgres    false    219   
=       0          0    18766 
   ins_course 
   TABLE DATA           ?   COPY public.ins_course (course_id, instructors_id) FROM stdin;
    public          postgres    false    217   u=       )          0    18718    instructors 
   TABLE DATA           F   COPY public.instructors (id, public_id, name_instructors) FROM stdin;
    public          postgres    false    210   �=       -          0    18738    user 
   TABLE DATA           S   COPY public."user" (id, public_id, name, username, password, is_admin) FROM stdin;
    public          postgres    false    214   Q>       >           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    211            ?           0    0    course_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.course_id_seq', 13, true);
          public          postgres    false    215            @           0    0    enroll_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.enroll_id_seq', 2, true);
          public          postgres    false    218            A           0    0    instructors_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.instructors_id_seq', 4, true);
          public          postgres    false    209            B           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 2, true);
          public          postgres    false    213            �           2606    18735    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    212            �           2606    18759    course course_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.course DROP CONSTRAINT course_pkey;
       public            postgres    false    216            �           2606    18789    enroll enroll_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT enroll_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.enroll DROP CONSTRAINT enroll_pkey;
       public            postgres    false    219            �           2606    18770    ins_course ins_course_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.ins_course
    ADD CONSTRAINT ins_course_pkey PRIMARY KEY (course_id, instructors_id);
 D   ALTER TABLE ONLY public.ins_course DROP CONSTRAINT ins_course_pkey;
       public            postgres    false    217    217            �           2606    18725    instructors instructors_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.instructors DROP CONSTRAINT instructors_pkey;
       public            postgres    false    210            �           2606    18749    user user_password_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_password_key UNIQUE (password);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_password_key;
       public            postgres    false    214            �           2606    18745    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    214            �           2606    18747    user user_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_username_key;
       public            postgres    false    214            �           1259    18736    ix_category_id    INDEX     A   CREATE INDEX ix_category_id ON public.category USING btree (id);
 "   DROP INDEX public.ix_category_id;
       public            postgres    false    212            �           1259    18765    ix_course_id    INDEX     =   CREATE INDEX ix_course_id ON public.course USING btree (id);
     DROP INDEX public.ix_course_id;
       public            postgres    false    216            �           1259    18800    ix_enroll_id    INDEX     =   CREATE INDEX ix_enroll_id ON public.enroll USING btree (id);
     DROP INDEX public.ix_enroll_id;
       public            postgres    false    219            �           1259    18726    ix_instructors_id    INDEX     G   CREATE INDEX ix_instructors_id ON public.instructors USING btree (id);
 %   DROP INDEX public.ix_instructors_id;
       public            postgres    false    210            �           1259    18750 
   ix_user_id    INDEX     ;   CREATE INDEX ix_user_id ON public."user" USING btree (id);
    DROP INDEX public.ix_user_id;
       public            postgres    false    214            �           2606    18760    course course_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);
 H   ALTER TABLE ONLY public.course DROP CONSTRAINT course_category_id_fkey;
       public          postgres    false    212    3463    216            �           2606    18790    enroll enroll_course_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT enroll_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id);
 F   ALTER TABLE ONLY public.enroll DROP CONSTRAINT enroll_course_id_fkey;
       public          postgres    false    3473    219    216            �           2606    18795    enroll enroll_user_id_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY public.enroll
    ADD CONSTRAINT enroll_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);
 D   ALTER TABLE ONLY public.enroll DROP CONSTRAINT enroll_user_id_fkey;
       public          postgres    false    3469    219    214            �           2606    18771 $   ins_course ins_course_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ins_course
    ADD CONSTRAINT ins_course_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id);
 N   ALTER TABLE ONLY public.ins_course DROP CONSTRAINT ins_course_course_id_fkey;
       public          postgres    false    216    217    3473            �           2606    18776 )   ins_course ins_course_instructors_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ins_course
    ADD CONSTRAINT ins_course_instructors_id_fkey FOREIGN KEY (instructors_id) REFERENCES public.instructors(id);
 S   ALTER TABLE ONLY public.ins_course DROP CONSTRAINT ins_course_instructors_id_fkey;
       public          postgres    false    217    3460    210            +   �   x^��1n�  k�
>�'ll�����"R�4����X������WN3� f�Ϟ����q��9���ZOz��W��k�;�О�H���\(����Q�*k��~I<c�d��&3�� y��ZH��	e��Ԟ�����)A��bF��-,�	�0�efe�ŝj����Y2���Z��7�����L`�!X��X��ވ�}�%�G��<�}��x�)      /   R  x^�һj$1��X�z�2�_BÀY�l����Ҍ`�B�{��ی3Ƕ�J��X6ybL�� ���:a5�:?w\;����?�9�wb�F�g�����om\nw^�q��N�ϕ�+�emSoӅ�Tx�/�Q�m*����SCd�f*+d���
�$A�A	��(�	;�u�}_i{�|�]����?/����6O�)ԃ,(��U��q�A�@�2�j��!��Ne4���J�>��XuD���JA�#$sH�����N���36��\���O����k�����s�AjfS�VD��o[$���\r5%[Q���[�O�0�f&      2   [   x^M���0�7��2& ���M�%xƯ�U:�$�[�,L�B��5��*F30�)SLz��m����Dy��j�Z�������g�� @��      0   %   x^��4��4�24�4�24F��\��@"F��� J"G      )   �   x^�;�0 �9��Q�O�, V;�Bb 1��G]��r�1[eQX�w`+�4�\S+]��p߾�-bp��*�H�0����4�c��g��'�E�O��j�#9�A(�ڻ���E�M��L�S(��S�BXS-)��w�;>/1�?(h0U      -   �   x^5�1�0Eg����i������$��uh�'H0��'�G�9ZU�Q���S�ƬRsqjS����m���<�&�6h_C��jd>+/hm��i%��Q�X�gWFk�d���e��>~��i�'c�u�*U     