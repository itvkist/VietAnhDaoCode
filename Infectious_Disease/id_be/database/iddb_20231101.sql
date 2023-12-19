PGDMP                  
    {            iddb    16.0    16.0 Y   `           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            a           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            b           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            c           1262    24576    iddb    DATABASE        CREATE DATABASE iddb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE iddb;
                postgres    false            α            1259    24612    admin_permissions    TABLE     g  CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 %   DROP TABLE public.admin_permissions;
       public         heap    postgres    false            ▀            1259    24611    admin_permissions_id_seq    SEQUENCE     É   CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.admin_permissions_id_seq;
       public          postgres    false    224            d           0    0    admin_permissions_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;
          public          postgres    false    223            ⁿ            1259    24768    admin_permissions_role_links    TABLE     Ñ   CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);
 0   DROP TABLE public.admin_permissions_role_links;
       public         heap    postgres    false            √            1259    24767 #   admin_permissions_role_links_id_seq    SEQUENCE     ¢   CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.admin_permissions_role_links_id_seq;
       public          postgres    false    252            e           0    0 #   admin_permissions_role_links_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;
          public          postgres    false    251            Σ            1259    24634    admin_roles    TABLE     ;  CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.admin_roles;
       public         heap    postgres    false            π            1259    24633    admin_roles_id_seq    SEQUENCE     è   CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_roles_id_seq;
       public          postgres    false    228            f           0    0    admin_roles_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;
          public          postgres    false    227            Γ            1259    24623    admin_users    TABLE     B  CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.admin_users;
       public         heap    postgres    false            ß            1259    24622    admin_users_id_seq    SEQUENCE     è   CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_users_id_seq;
       public          postgres    false    226            g           0    0    admin_users_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;
          public          postgres    false    225            ■            1259    24780    admin_users_roles_links    TABLE     ╡   CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);
 +   DROP TABLE public.admin_users_roles_links;
       public         heap    postgres    false            ²            1259    24779    admin_users_roles_links_id_seq    SEQUENCE     û   CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.admin_users_roles_links_id_seq;
       public          postgres    false    254            h           0    0    admin_users_roles_links_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;
          public          postgres    false    253                       1259    25121    doctors    TABLE       CREATE TABLE public.doctors (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.doctors;
       public         heap    postgres    false            
           1259    25120    doctors_id_seq    SEQUENCE     å   CREATE SEQUENCE public.doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.doctors_id_seq;
       public          postgres    false    270            i           0    0    doctors_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;
          public          postgres    false    269            ≡            1259    24694    files    TABLE     ú  CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.files;
       public         heap    postgres    false                       1259    24829    files_folder_links    TABLE     æ   CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);
 &   DROP TABLE public.files_folder_links;
       public         heap    postgres    false                       1259    24828    files_folder_links_id_seq    SEQUENCE     æ   CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.files_folder_links_id_seq;
       public          postgres    false    262            j           0    0    files_folder_links_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;
          public          postgres    false    261            ∩            1259    24693    files_id_seq    SEQUENCE     ä   CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public          postgres    false    240            k           0    0    files_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
          public          postgres    false    239                       1259    24817    files_related_morphs    TABLE     ▄   CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);
 (   DROP TABLE public.files_related_morphs;
       public         heap    postgres    false                       1259    24816    files_related_morphs_id_seq    SEQUENCE     ô   CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.files_related_morphs_id_seq;
       public          postgres    false    260            l           0    0    files_related_morphs_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;
          public          postgres    false    259            ⌠            1259    24726    i18n_locale    TABLE       CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.i18n_locale;
       public         heap    postgres    false            ≤            1259    24725    i18n_locale_id_seq    SEQUENCE     è   CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.i18n_locale_id_seq;
       public          postgres    false    244            m           0    0    i18n_locale_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;
          public          postgres    false    243            ε            1259    24685    infectious_diseases    TABLE     ¢  CREATE TABLE public.infectious_diseases (
    id integer NOT NULL,
    label character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    name character varying(255),
    symptom text,
    effect text,
    prevention text,
    information text
);
 '   DROP TABLE public.infectious_diseases;
       public         heap    postgres    false            φ            1259    24684    infectious_diseases_id_seq    SEQUENCE     Æ   CREATE SEQUENCE public.infectious_diseases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.infectious_diseases_id_seq;
       public          postgres    false    238            n           0    0    infectious_diseases_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.infectious_diseases_id_seq OWNED BY public.infectious_diseases.id;
          public          postgres    false    237                       1259    25142    patients    TABLE        CREATE TABLE public.patients (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.patients;
       public         heap    postgres    false                       1259    25189    patients_doctor_links    TABLE     Ü   CREATE TABLE public.patients_doctor_links (
    id integer NOT NULL,
    patient_id integer,
    doctor_id integer,
    patient_order double precision
);
 )   DROP TABLE public.patients_doctor_links;
       public         heap    postgres    false                       1259    25188    patients_doctor_links_id_seq    SEQUENCE     ö   CREATE SEQUENCE public.patients_doctor_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.patients_doctor_links_id_seq;
       public          postgres    false    274            o           0    0    patients_doctor_links_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.patients_doctor_links_id_seq OWNED BY public.patients_doctor_links.id;
          public          postgres    false    273                       1259    25141    patients_id_seq    SEQUENCE     ç   CREATE SEQUENCE public.patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.patients_id_seq;
       public          postgres    false    272            p           0    0    patients_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;
          public          postgres    false    271            Φ            1259    24656    strapi_api_token_permissions    TABLE       CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 0   DROP TABLE public.strapi_api_token_permissions;
       public         heap    postgres    false            τ            1259    24655 #   strapi_api_token_permissions_id_seq    SEQUENCE     ¢   CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.strapi_api_token_permissions_id_seq;
       public          postgres    false    232            q           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;
          public          postgres    false    231                        1259    24793 (   strapi_api_token_permissions_token_links    TABLE     ╩   CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);
 <   DROP TABLE public.strapi_api_token_permissions_token_links;
       public         heap    postgres    false                         1259    24792 /   strapi_api_token_permissions_token_links_id_seq    SEQUENCE     º   CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.strapi_api_token_permissions_token_links_id_seq;
       public          postgres    false    256            r           0    0 /   strapi_api_token_permissions_token_links_id_seq    SEQUENCE OWNED BY     â   ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;
          public          postgres    false    255            µ            1259    24645    strapi_api_tokens    TABLE     ▌  CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 %   DROP TABLE public.strapi_api_tokens;
       public         heap    postgres    false            σ            1259    24644    strapi_api_tokens_id_seq    SEQUENCE     É   CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_api_tokens_id_seq;
       public          postgres    false    230            s           0    0    strapi_api_tokens_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;
          public          postgres    false    229            ▄            1259    24594    strapi_core_store_settings    TABLE     σ   CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);
 .   DROP TABLE public.strapi_core_store_settings;
       public         heap    postgres    false            █            1259    24593 !   strapi_core_store_settings_id_seq    SEQUENCE     Ö   CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.strapi_core_store_settings_id_seq;
       public          postgres    false    220            t           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;
          public          postgres    false    219            ┌            1259    24585    strapi_database_schema    TABLE     ó   CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);
 *   DROP TABLE public.strapi_database_schema;
       public         heap    postgres    false            ┘            1259    24584    strapi_database_schema_id_seq    SEQUENCE     ò   CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_database_schema_id_seq;
       public          postgres    false    218            u           0    0    strapi_database_schema_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;
          public          postgres    false    217            ╪            1259    24578    strapi_migrations    TABLE     î   CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);
 %   DROP TABLE public.strapi_migrations;
       public         heap    postgres    false            ╫            1259    24577    strapi_migrations_id_seq    SEQUENCE     É   CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.strapi_migrations_id_seq;
       public          postgres    false    216            v           0    0    strapi_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;
          public          postgres    false    215            ∞            1259    24676 !   strapi_transfer_token_permissions    TABLE     
  CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 5   DROP TABLE public.strapi_transfer_token_permissions;
       public         heap    postgres    false            δ            1259    24675 (   strapi_transfer_token_permissions_id_seq    SEQUENCE     á   CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.strapi_transfer_token_permissions_id_seq;
       public          postgres    false    236            w           0    0 (   strapi_transfer_token_permissions_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;
          public          postgres    false    235                       1259    24805 -   strapi_transfer_token_permissions_token_links    TABLE     ▐   CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);
 A   DROP TABLE public.strapi_transfer_token_permissions_token_links;
       public         heap    postgres    false                       1259    24804 4   strapi_transfer_token_permissions_token_links_id_seq    SEQUENCE     ¼   CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq;
       public          postgres    false    258            x           0    0 4   strapi_transfer_token_permissions_token_links_id_seq    SEQUENCE OWNED BY     ì   ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;
          public          postgres    false    257            Ω            1259    24665    strapi_transfer_tokens    TABLE     ┴  CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 *   DROP TABLE public.strapi_transfer_tokens;
       public         heap    postgres    false            Θ            1259    24664    strapi_transfer_tokens_id_seq    SEQUENCE     ò   CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.strapi_transfer_tokens_id_seq;
       public          postgres    false    234            y           0    0    strapi_transfer_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;
          public          postgres    false    233            ▐            1259    24603    strapi_webhooks    TABLE     ¬   CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);
 #   DROP TABLE public.strapi_webhooks;
       public         heap    postgres    false            ▌            1259    24602    strapi_webhooks_id_seq    SEQUENCE     Ä   CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strapi_webhooks_id_seq;
       public          postgres    false    222            z           0    0    strapi_webhooks_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;
          public          postgres    false    221            ÷            1259    24737    up_permissions    TABLE     ≈   CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 "   DROP TABLE public.up_permissions;
       public         heap    postgres    false            ⌡            1259    24736    up_permissions_id_seq    SEQUENCE     ì   CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.up_permissions_id_seq;
       public          postgres    false    246            {           0    0    up_permissions_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;
          public          postgres    false    245            
           1259    24853    up_permissions_role_links    TABLE     ó   CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);
 -   DROP TABLE public.up_permissions_role_links;
       public         heap    postgres    false            	           1259    24852     up_permissions_role_links_id_seq    SEQUENCE     ÿ   CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.up_permissions_role_links_id_seq;
       public          postgres    false    266            |           0    0     up_permissions_role_links_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;
          public          postgres    false    265            °            1259    24746    up_roles    TABLE     8  CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.up_roles;
       public         heap    postgres    false            ≈            1259    24745    up_roles_id_seq    SEQUENCE     ç   CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_roles_id_seq;
       public          postgres    false    248            }           0    0    up_roles_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;
          public          postgres    false    247            ·            1259    24757    up_users    TABLE     δ  CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
    DROP TABLE public.up_users;
       public         heap    postgres    false            ∙            1259    24756    up_users_id_seq    SEQUENCE     ç   CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.up_users_id_seq;
       public          postgres    false    250            ~           0    0    up_users_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;
          public          postgres    false    249                       1259    24865    up_users_role_links    TABLE     É   CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);
 '   DROP TABLE public.up_users_role_links;
       public         heap    postgres    false                       1259    24864    up_users_role_links_id_seq    SEQUENCE     Æ   CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.up_users_role_links_id_seq;
       public          postgres    false    268                       0    0    up_users_role_links_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;
          public          postgres    false    267            ≥            1259    24711    upload_folders    TABLE     +  CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);
 "   DROP TABLE public.upload_folders;
       public         heap    postgres    false            ±            1259    24710    upload_folders_id_seq    SEQUENCE     ì   CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.upload_folders_id_seq;
       public          postgres    false    242            Ç           0    0    upload_folders_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;
          public          postgres    false    241                       1259    24841    upload_folders_parent_links    TABLE     ó   CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);
 /   DROP TABLE public.upload_folders_parent_links;
       public         heap    postgres    false                       1259    24840 "   upload_folders_parent_links_id_seq    SEQUENCE     Ü   CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.upload_folders_parent_links_id_seq;
       public          postgres    false    264            ü           0    0 "   upload_folders_parent_links_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;
          public          postgres    false    263            »           2604    24615    admin_permissions id    DEFAULT     |   ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);
 C   ALTER TABLE public.admin_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            ╜           2604    24771    admin_permissions_role_links id    DEFAULT     Æ   ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);
 N   ALTER TABLE public.admin_permissions_role_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252            ▒           2604    24637    admin_roles id    DEFAULT     p   ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);
 =   ALTER TABLE public.admin_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            ░           2604    24626    admin_users id    DEFAULT     p   ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);
 =   ALTER TABLE public.admin_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            ╛           2604    24783    admin_users_roles_links id    DEFAULT     ê   ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);
 I   ALTER TABLE public.admin_users_roles_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            ╞           2604    25124 
   doctors id    DEFAULT     h   ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);
 9   ALTER TABLE public.doctors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    270    269    270            ╖           2604    24697    files id    DEFAULT     d   ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240            ┬           2604    24832    files_folder_links id    DEFAULT     ~   ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);
 D   ALTER TABLE public.files_folder_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    262    261    262            ┴           2604    24820    files_related_morphs id    DEFAULT     é   ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);
 F   ALTER TABLE public.files_related_morphs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    259    260    260            ╣           2604    24729    i18n_locale id    DEFAULT     p   ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);
 =   ALTER TABLE public.i18n_locale ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244            ╢           2604    24688    infectious_diseases id    DEFAULT     Ç   ALTER TABLE ONLY public.infectious_diseases ALTER COLUMN id SET DEFAULT nextval('public.infectious_diseases_id_seq'::regclass);
 E   ALTER TABLE public.infectious_diseases ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238            ╟           2604    25145    patients id    DEFAULT     j   ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);
 :   ALTER TABLE public.patients ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    272    271    272            ╚           2604    25192    patients_doctor_links id    DEFAULT     ä   ALTER TABLE ONLY public.patients_doctor_links ALTER COLUMN id SET DEFAULT nextval('public.patients_doctor_links_id_seq'::regclass);
 G   ALTER TABLE public.patients_doctor_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    273    274    274            │           2604    24659    strapi_api_token_permissions id    DEFAULT     Æ   ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);
 N   ALTER TABLE public.strapi_api_token_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            ┐           2604    24796 +   strapi_api_token_permissions_token_links id    DEFAULT     ¬   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);
 Z   ALTER TABLE public.strapi_api_token_permissions_token_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    256    255    256            ▓           2604    24648    strapi_api_tokens id    DEFAULT     |   ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);
 C   ALTER TABLE public.strapi_api_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            ¡           2604    24597    strapi_core_store_settings id    DEFAULT     Ä   ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);
 L   ALTER TABLE public.strapi_core_store_settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            ¼           2604    24588    strapi_database_schema id    DEFAULT     å   ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);
 H   ALTER TABLE public.strapi_database_schema ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            ½           2604    24581    strapi_migrations id    DEFAULT     |   ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);
 C   ALTER TABLE public.strapi_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            ╡           2604    24679 $   strapi_transfer_token_permissions id    DEFAULT     £   ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);
 S   ALTER TABLE public.strapi_transfer_token_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            └           2604    24808 0   strapi_transfer_token_permissions_token_links id    DEFAULT     ┤   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);
 _   ALTER TABLE public.strapi_transfer_token_permissions_token_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    258    258            ┤           2604    24668    strapi_transfer_tokens id    DEFAULT     å   ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);
 H   ALTER TABLE public.strapi_transfer_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            «           2604    24606    strapi_webhooks id    DEFAULT     x   ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);
 A   ALTER TABLE public.strapi_webhooks ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            ║           2604    24740    up_permissions id    DEFAULT     v   ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);
 @   ALTER TABLE public.up_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            ─           2604    24856    up_permissions_role_links id    DEFAULT     î   ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);
 K   ALTER TABLE public.up_permissions_role_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    265    266    266            ╗           2604    24749    up_roles id    DEFAULT     j   ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);
 :   ALTER TABLE public.up_roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248            ╝           2604    24760    up_users id    DEFAULT     j   ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);
 :   ALTER TABLE public.up_users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            ┼           2604    24868    up_users_role_links id    DEFAULT     Ç   ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);
 E   ALTER TABLE public.up_users_role_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    268    267    268            ╕           2604    24714    upload_folders id    DEFAULT     v   ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);
 @   ALTER TABLE public.upload_folders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    242    242            ├           2604    24844    upload_folders_parent_links id    DEFAULT     É   ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);
 M   ALTER TABLE public.upload_folders_parent_links ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    263    264    264            +          0    24612    admin_permissions 
   TABLE DATA           í   COPY public.admin_permissions (id, action, action_parameters, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    224            G          0    24768    admin_permissions_role_links 
   TABLE DATA           d   COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
    public          postgres    false    252            /          0    24634    admin_roles 
   TABLE DATA           x   COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    228            -          0    24623    admin_users 
   TABLE DATA           α   COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    226            I          0    24780    admin_users_roles_links 
   TABLE DATA           _   COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
    public          postgres    false    254            Y          0    25121    doctors 
   TABLE DATA           o   COPY public.doctors (id, name, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    270            ;          0    24694    files 
   TABLE DATA           σ   COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    240            Q          0    24829    files_folder_links 
   TABLE DATA           P   COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
    public          postgres    false    262            O          0    24817    files_related_morphs 
   TABLE DATA           e   COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
    public          postgres    false    260            ?          0    24726    i18n_locale 
   TABLE DATA           k   COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    244            9          0    24685    infectious_diseases 
   TABLE DATA           ¼   COPY public.infectious_diseases (id, label, created_at, updated_at, published_at, created_by_id, updated_by_id, name, symptom, effect, prevention, information) FROM stdin;
    public          postgres    false    238            [          0    25142    patients 
   TABLE DATA           p   COPY public.patients (id, name, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    272            ]          0    25189    patients_doctor_links 
   TABLE DATA           Y   COPY public.patients_doctor_links (id, patient_id, doctor_id, patient_order) FROM stdin;
    public          postgres    false    274            3          0    24656    strapi_api_token_permissions 
   TABLE DATA           x   COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    232            K          0    24793 (   strapi_api_token_permissions_token_links 
   TABLE DATA           ë   COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
    public          postgres    false    256            1          0    24645    strapi_api_tokens 
   TABLE DATA           «   COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    230            '          0    24594    strapi_core_store_settings 
   TABLE DATA           \   COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
    public          postgres    false    220            %          0    24585    strapi_database_schema 
   TABLE DATA           J   COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
    public          postgres    false    218            #          0    24578    strapi_migrations 
   TABLE DATA           =   COPY public.strapi_migrations (id, name, "time") FROM stdin;
    public          postgres    false    216            7          0    24676 !   strapi_transfer_token_permissions 
   TABLE DATA           }   COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    236            M          0    24805 -   strapi_transfer_token_permissions_token_links 
   TABLE DATA           ¥   COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
    public          postgres    false    258            5          0    24665    strapi_transfer_tokens 
   TABLE DATA           ¡   COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    234            )          0    24603    strapi_webhooks 
   TABLE DATA           R   COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
    public          postgres    false    222            A          0    24737    up_permissions 
   TABLE DATA           j   COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    246            U          0    24853    up_permissions_role_links 
   TABLE DATA           a   COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
    public          postgres    false    266            C          0    24746    up_roles 
   TABLE DATA           u   COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    248            E          0    24757    up_users 
   TABLE DATA           ┐   COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    250            W          0    24865    up_users_role_links 
   TABLE DATA           O   COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
    public          postgres    false    268            =          0    24711    upload_folders 
   TABLE DATA           w   COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
    public          postgres    false    242            S          0    24841    upload_folders_parent_links 
   TABLE DATA           a   COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
    public          postgres    false    264            é           0    0    admin_permissions_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.admin_permissions_id_seq', 123, true);
          public          postgres    false    223            â           0    0 #   admin_permissions_role_links_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 123, true);
          public          postgres    false    251            ä           0    0    admin_roles_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);
          public          postgres    false    227            à           0    0    admin_users_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);
          public          postgres    false    225            å           0    0    admin_users_roles_links_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 1, true);
          public          postgres    false    253            ç           0    0    doctors_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.doctors_id_seq', 1, false);
          public          postgres    false    269            ê           0    0    files_folder_links_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);
          public          postgres    false    261            ë           0    0    files_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.files_id_seq', 1, false);
          public          postgres    false    239            è           0    0    files_related_morphs_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 1, false);
          public          postgres    false    259            ï           0    0    i18n_locale_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);
          public          postgres    false    243            î           0    0    infectious_diseases_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.infectious_diseases_id_seq', 1, true);
          public          postgres    false    237            ì           0    0    patients_doctor_links_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.patients_doctor_links_id_seq', 1, false);
          public          postgres    false    273            Ä           0    0    patients_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.patients_id_seq', 1, false);
          public          postgres    false    271            Å           0    0 #   strapi_api_token_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);
          public          postgres    false    231            É           0    0 /   strapi_api_token_permissions_token_links_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);
          public          postgres    false    255            æ           0    0    strapi_api_tokens_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);
          public          postgres    false    229            Æ           0    0 !   strapi_core_store_settings_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 25, true);
          public          postgres    false    219            ô           0    0    strapi_database_schema_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 13, true);
          public          postgres    false    217            ö           0    0    strapi_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);
          public          postgres    false    215            ò           0    0 (   strapi_transfer_token_permissions_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);
          public          postgres    false    235            û           0    0 4   strapi_transfer_token_permissions_token_links_id_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);
          public          postgres    false    257            ù           0    0    strapi_transfer_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);
          public          postgres    false    233            ÿ           0    0    strapi_webhooks_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);
          public          postgres    false    221            Ö           0    0    up_permissions_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.up_permissions_id_seq', 11, true);
          public          postgres    false    245            Ü           0    0     up_permissions_role_links_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 11, true);
          public          postgres    false    265            ¢           0    0    up_roles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);
          public          postgres    false    247            £           0    0    up_users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);
          public          postgres    false    249            ¥           0    0    up_users_role_links_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, false);
          public          postgres    false    267            ₧           0    0    upload_folders_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);
          public          postgres    false    241            ƒ           0    0 "   upload_folders_parent_links_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);
          public          postgres    false    263            ╙           2606    24619 (   admin_permissions admin_permissions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_pkey;
       public            postgres    false    224                       2606    24773 >   admin_permissions_role_links admin_permissions_role_links_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_pkey;
       public            postgres    false    252                       2606    24777 @   admin_permissions_role_links admin_permissions_role_links_unique 
   CONSTRAINT     ì   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);
 j   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_unique;
       public            postgres    false    252    252            █           2606    24641    admin_roles admin_roles_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_pkey;
       public            postgres    false    228            ╫           2606    24630    admin_users admin_users_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_pkey;
       public            postgres    false    226                       2606    24785 4   admin_users_roles_links admin_users_roles_links_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_pkey;
       public            postgres    false    254            !           2606    24789 6   admin_users_roles_links admin_users_roles_links_unique 
   CONSTRAINT     }   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);
 `   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_unique;
       public            postgres    false    254    254            S           2606    25126    doctors doctors_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.doctors DROP CONSTRAINT doctors_pkey;
       public            postgres    false    270            9           2606    24834 *   files_folder_links files_folder_links_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_pkey;
       public            postgres    false    262            ;           2606    24838 ,   files_folder_links files_folder_links_unique 
   CONSTRAINT     u   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);
 V   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_unique;
       public            postgres    false    262    262            ≤           2606    24701    files files_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public            postgres    false    240            4           2606    24824 .   files_related_morphs files_related_morphs_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.files_related_morphs DROP CONSTRAINT files_related_morphs_pkey;
       public            postgres    false    260                       2606    24733    i18n_locale i18n_locale_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_pkey;
       public            postgres    false    244            ∩           2606    24690 ,   infectious_diseases infectious_diseases_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.infectious_diseases
    ADD CONSTRAINT infectious_diseases_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.infectious_diseases DROP CONSTRAINT infectious_diseases_pkey;
       public            postgres    false    238            ]           2606    25194 0   patients_doctor_links patients_doctor_links_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.patients_doctor_links
    ADD CONSTRAINT patients_doctor_links_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.patients_doctor_links DROP CONSTRAINT patients_doctor_links_pkey;
       public            postgres    false    274            _           2606    25198 2   patients_doctor_links patients_doctor_links_unique 
   CONSTRAINT     ~   ALTER TABLE ONLY public.patients_doctor_links
    ADD CONSTRAINT patients_doctor_links_unique UNIQUE (patient_id, doctor_id);
 \   ALTER TABLE ONLY public.patients_doctor_links DROP CONSTRAINT patients_doctor_links_unique;
       public            postgres    false    274    274            W           2606    25147    patients patients_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_pkey;
       public            postgres    false    272            π           2606    24661 >   strapi_api_token_permissions strapi_api_token_permissions_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_pkey;
       public            postgres    false    232            &           2606    24798 V   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey 
   CONSTRAINT     ö   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);
 Ç   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_pkey;
       public            postgres    false    256            (           2606    24802 X   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique 
   CONSTRAINT     ┤   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);
 é   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_unique;
       public            postgres    false    256    256            ▀           2606    24652 (   strapi_api_tokens strapi_api_tokens_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_pkey;
       public            postgres    false    230            ╬           2606    24601 :   strapi_core_store_settings strapi_core_store_settings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.strapi_core_store_settings DROP CONSTRAINT strapi_core_store_settings_pkey;
       public            postgres    false    220            ╠           2606    24592 2   strapi_database_schema strapi_database_schema_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_database_schema DROP CONSTRAINT strapi_database_schema_pkey;
       public            postgres    false    218            ╩           2606    24583 (   strapi_migrations strapi_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.strapi_migrations DROP CONSTRAINT strapi_migrations_pkey;
       public            postgres    false    216            δ           2606    24681 H   strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey 
   CONSTRAINT     å   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);
 r   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_pkey;
       public            postgres    false    236            -           2606    24810 `   strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey 
   CONSTRAINT     ₧   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);
 è   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links DROP CONSTRAINT strapi_transfer_token_permissions_token_links_pkey;
       public            postgres    false    258            /           2606    24814 b   strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique 
   CONSTRAINT     ╚   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);
 î   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links DROP CONSTRAINT strapi_transfer_token_permissions_token_links_unique;
       public            postgres    false    258    258            τ           2606    24672 2   strapi_transfer_tokens strapi_transfer_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_pkey;
       public            postgres    false    234            ╨           2606    24610 $   strapi_webhooks strapi_webhooks_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strapi_webhooks DROP CONSTRAINT strapi_webhooks_pkey;
       public            postgres    false    222            	           2606    24742 "   up_permissions up_permissions_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_pkey;
       public            postgres    false    246            G           2606    24858 8   up_permissions_role_links up_permissions_role_links_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_pkey;
       public            postgres    false    266            I           2606    24862 :   up_permissions_role_links up_permissions_role_links_unique 
   CONSTRAINT     ç   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);
 d   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_unique;
       public            postgres    false    266    266            
           2606    24753    up_roles up_roles_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_pkey;
       public            postgres    false    248                       2606    24764    up_users up_users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_pkey;
       public            postgres    false    250            N           2606    24870 ,   up_users_role_links up_users_role_links_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_pkey;
       public            postgres    false    268            P           2606    24874 .   up_users_role_links up_users_role_links_unique 
   CONSTRAINT     u   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);
 X   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_unique;
       public            postgres    false    268    268            @           2606    24846 <   upload_folders_parent_links upload_folders_parent_links_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_pkey;
       public            postgres    false    264            B           2606    24850 >   upload_folders_parent_links upload_folders_parent_links_unique 
   CONSTRAINT     ì   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);
 h   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_unique;
       public            postgres    false    264    264            ²           2606    24720 +   upload_folders upload_folders_path_id_index 
   CONSTRAINT     i   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);
 U   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_id_index;
       public            postgres    false    242                        2606    24722 (   upload_folders upload_folders_path_index 
   CONSTRAINT     c   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);
 R   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_path_index;
       public            postgres    false    242                       2606    24718 "   upload_folders upload_folders_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_pkey;
       public            postgres    false    242            ╤           1259    24620 "   admin_permissions_created_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);
 6   DROP INDEX public.admin_permissions_created_by_id_fk;
       public            postgres    false    224                       1259    24774    admin_permissions_role_links_fk    INDEX     q   CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);
 3   DROP INDEX public.admin_permissions_role_links_fk;
       public            postgres    false    252                       1259    24775 #   admin_permissions_role_links_inv_fk    INDEX     o   CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);
 7   DROP INDEX public.admin_permissions_role_links_inv_fk;
       public            postgres    false    252                       1259    24778 )   admin_permissions_role_links_order_inv_fk    INDEX     ~   CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);
 =   DROP INDEX public.admin_permissions_role_links_order_inv_fk;
       public            postgres    false    252            ╘           1259    24621 "   admin_permissions_updated_by_id_fk    INDEX     i   CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);
 6   DROP INDEX public.admin_permissions_updated_by_id_fk;
       public            postgres    false    224            ┘           1259    24642    admin_roles_created_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);
 0   DROP INDEX public.admin_roles_created_by_id_fk;
       public            postgres    false    228            ▄           1259    24643    admin_roles_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);
 0   DROP INDEX public.admin_roles_updated_by_id_fk;
       public            postgres    false    228            ╒           1259    24631    admin_users_created_by_id_fk    INDEX     ]   CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);
 0   DROP INDEX public.admin_users_created_by_id_fk;
       public            postgres    false    226                       1259    24786    admin_users_roles_links_fk    INDEX     a   CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);
 .   DROP INDEX public.admin_users_roles_links_fk;
       public            postgres    false    254                       1259    24787    admin_users_roles_links_inv_fk    INDEX     e   CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);
 2   DROP INDEX public.admin_users_roles_links_inv_fk;
       public            postgres    false    254                       1259    24790     admin_users_roles_links_order_fk    INDEX     j   CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);
 4   DROP INDEX public.admin_users_roles_links_order_fk;
       public            postgres    false    254                       1259    24791 $   admin_users_roles_links_order_inv_fk    INDEX     n   CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);
 8   DROP INDEX public.admin_users_roles_links_order_inv_fk;
       public            postgres    false    254            ╪           1259    24632    admin_users_updated_by_id_fk    INDEX     ]   CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);
 0   DROP INDEX public.admin_users_updated_by_id_fk;
       public            postgres    false    226            Q           1259    25127    doctors_created_by_id_fk    INDEX     U   CREATE INDEX doctors_created_by_id_fk ON public.doctors USING btree (created_by_id);
 ,   DROP INDEX public.doctors_created_by_id_fk;
       public            postgres    false    270            T           1259    25128    doctors_updated_by_id_fk    INDEX     U   CREATE INDEX doctors_updated_by_id_fk ON public.doctors USING btree (updated_by_id);
 ,   DROP INDEX public.doctors_updated_by_id_fk;
       public            postgres    false    270            ±           1259    24708    files_created_by_id_fk    INDEX     Q   CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);
 *   DROP INDEX public.files_created_by_id_fk;
       public            postgres    false    240            5           1259    24835    files_folder_links_fk    INDEX     W   CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);
 )   DROP INDEX public.files_folder_links_fk;
       public            postgres    false    262            6           1259    24836    files_folder_links_inv_fk    INDEX     ]   CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);
 -   DROP INDEX public.files_folder_links_inv_fk;
       public            postgres    false    262            7           1259    24839    files_folder_links_order_inv_fk    INDEX     d   CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);
 3   DROP INDEX public.files_folder_links_order_inv_fk;
       public            postgres    false    262            0           1259    24825    files_related_morphs_fk    INDEX     [   CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);
 +   DROP INDEX public.files_related_morphs_fk;
       public            postgres    false    260            1           1259    24827 $   files_related_morphs_id_column_index    INDEX     k   CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);
 8   DROP INDEX public.files_related_morphs_id_column_index;
       public            postgres    false    260            2           1259    24826     files_related_morphs_order_index    INDEX     d   CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");
 4   DROP INDEX public.files_related_morphs_order_index;
       public            postgres    false    260            ⌠           1259    24709    files_updated_by_id_fk    INDEX     Q   CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);
 *   DROP INDEX public.files_updated_by_id_fk;
       public            postgres    false    240                       1259    24734    i18n_locale_created_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);
 0   DROP INDEX public.i18n_locale_created_by_id_fk;
       public            postgres    false    244                       1259    24735    i18n_locale_updated_by_id_fk    INDEX     ]   CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);
 0   DROP INDEX public.i18n_locale_updated_by_id_fk;
       public            postgres    false    244            φ           1259    24691 $   infectious_diseases_created_by_id_fk    INDEX     m   CREATE INDEX infectious_diseases_created_by_id_fk ON public.infectious_diseases USING btree (created_by_id);
 8   DROP INDEX public.infectious_diseases_created_by_id_fk;
       public            postgres    false    238            ≡           1259    24692 $   infectious_diseases_updated_by_id_fk    INDEX     m   CREATE INDEX infectious_diseases_updated_by_id_fk ON public.infectious_diseases USING btree (updated_by_id);
 8   DROP INDEX public.infectious_diseases_updated_by_id_fk;
       public            postgres    false    238            U           1259    25148    patients_created_by_id_fk    INDEX     W   CREATE INDEX patients_created_by_id_fk ON public.patients USING btree (created_by_id);
 -   DROP INDEX public.patients_created_by_id_fk;
       public            postgres    false    272            Y           1259    25195    patients_doctor_links_fk    INDEX     `   CREATE INDEX patients_doctor_links_fk ON public.patients_doctor_links USING btree (patient_id);
 ,   DROP INDEX public.patients_doctor_links_fk;
       public            postgres    false    274            Z           1259    25196    patients_doctor_links_inv_fk    INDEX     c   CREATE INDEX patients_doctor_links_inv_fk ON public.patients_doctor_links USING btree (doctor_id);
 0   DROP INDEX public.patients_doctor_links_inv_fk;
       public            postgres    false    274            [           1259    25199 "   patients_doctor_links_order_inv_fk    INDEX     m   CREATE INDEX patients_doctor_links_order_inv_fk ON public.patients_doctor_links USING btree (patient_order);
 6   DROP INDEX public.patients_doctor_links_order_inv_fk;
       public            postgres    false    274            X           1259    25149    patients_updated_by_id_fk    INDEX     W   CREATE INDEX patients_updated_by_id_fk ON public.patients USING btree (updated_by_id);
 -   DROP INDEX public.patients_updated_by_id_fk;
       public            postgres    false    272            ß           1259    24662 -   strapi_api_token_permissions_created_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_created_by_id_fk;
       public            postgres    false    232            "           1259    24799 +   strapi_api_token_permissions_token_links_fk    INDEX     ô   CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);
 ?   DROP INDEX public.strapi_api_token_permissions_token_links_fk;
       public            postgres    false    256            #           1259    24800 /   strapi_api_token_permissions_token_links_inv_fk    INDEX     î   CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);
 C   DROP INDEX public.strapi_api_token_permissions_token_links_inv_fk;
       public            postgres    false    256            $           1259    24803 5   strapi_api_token_permissions_token_links_order_inv_fk    INDEX     á   CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);
 I   DROP INDEX public.strapi_api_token_permissions_token_links_order_inv_fk;
       public            postgres    false    256            Σ           1259    24663 -   strapi_api_token_permissions_updated_by_id_fk    INDEX        CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);
 A   DROP INDEX public.strapi_api_token_permissions_updated_by_id_fk;
       public            postgres    false    232            ▌           1259    24653 "   strapi_api_tokens_created_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);
 6   DROP INDEX public.strapi_api_tokens_created_by_id_fk;
       public            postgres    false    230            α           1259    24654 "   strapi_api_tokens_updated_by_id_fk    INDEX     i   CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);
 6   DROP INDEX public.strapi_api_tokens_updated_by_id_fk;
       public            postgres    false    230            Θ           1259    24682 2   strapi_transfer_token_permissions_created_by_id_fk    INDEX     ë   CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);
 F   DROP INDEX public.strapi_transfer_token_permissions_created_by_id_fk;
       public            postgres    false    236            )           1259    24811 0   strapi_transfer_token_permissions_token_links_fk    INDEX     ó   CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);
 D   DROP INDEX public.strapi_transfer_token_permissions_token_links_fk;
       public            postgres    false    258            *           1259    24812 4   strapi_transfer_token_permissions_token_links_inv_fk    INDEX     ¢   CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);
 H   DROP INDEX public.strapi_transfer_token_permissions_token_links_inv_fk;
       public            postgres    false    258            +           1259    24815 :   strapi_transfer_token_permissions_token_links_order_inv_fk    INDEX     »   CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);
 N   DROP INDEX public.strapi_transfer_token_permissions_token_links_order_inv_fk;
       public            postgres    false    258            ∞           1259    24683 2   strapi_transfer_token_permissions_updated_by_id_fk    INDEX     ë   CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);
 F   DROP INDEX public.strapi_transfer_token_permissions_updated_by_id_fk;
       public            postgres    false    236            σ           1259    24673 '   strapi_transfer_tokens_created_by_id_fk    INDEX     s   CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);
 ;   DROP INDEX public.strapi_transfer_tokens_created_by_id_fk;
       public            postgres    false    234            Φ           1259    24674 '   strapi_transfer_tokens_updated_by_id_fk    INDEX     s   CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);
 ;   DROP INDEX public.strapi_transfer_tokens_updated_by_id_fk;
       public            postgres    false    234                       1259    24743    up_permissions_created_by_id_fk    INDEX     c   CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);
 3   DROP INDEX public.up_permissions_created_by_id_fk;
       public            postgres    false    246            C           1259    24859    up_permissions_role_links_fk    INDEX     k   CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);
 0   DROP INDEX public.up_permissions_role_links_fk;
       public            postgres    false    266            D           1259    24860     up_permissions_role_links_inv_fk    INDEX     i   CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);
 4   DROP INDEX public.up_permissions_role_links_inv_fk;
       public            postgres    false    266            E           1259    24863 &   up_permissions_role_links_order_inv_fk    INDEX     x   CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);
 :   DROP INDEX public.up_permissions_role_links_order_inv_fk;
       public            postgres    false    266            
           1259    24744    up_permissions_updated_by_id_fk    INDEX     c   CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);
 3   DROP INDEX public.up_permissions_updated_by_id_fk;
       public            postgres    false    246                       1259    24754    up_roles_created_by_id_fk    INDEX     W   CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);
 -   DROP INDEX public.up_roles_created_by_id_fk;
       public            postgres    false    248                       1259    24755    up_roles_updated_by_id_fk    INDEX     W   CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);
 -   DROP INDEX public.up_roles_updated_by_id_fk;
       public            postgres    false    248                       1259    24765    up_users_created_by_id_fk    INDEX     W   CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);
 -   DROP INDEX public.up_users_created_by_id_fk;
       public            postgres    false    250            J           1259    24871    up_users_role_links_fk    INDEX     Y   CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);
 *   DROP INDEX public.up_users_role_links_fk;
       public            postgres    false    268            K           1259    24872    up_users_role_links_inv_fk    INDEX     ]   CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);
 .   DROP INDEX public.up_users_role_links_inv_fk;
       public            postgres    false    268            L           1259    24875     up_users_role_links_order_inv_fk    INDEX     f   CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);
 4   DROP INDEX public.up_users_role_links_order_inv_fk;
       public            postgres    false    268                       1259    24766    up_users_updated_by_id_fk    INDEX     W   CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);
 -   DROP INDEX public.up_users_updated_by_id_fk;
       public            postgres    false    250            ⌡           1259    24703    upload_files_created_at_index    INDEX     U   CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);
 1   DROP INDEX public.upload_files_created_at_index;
       public            postgres    false    240            ÷           1259    24707    upload_files_ext_index    INDEX     G   CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);
 *   DROP INDEX public.upload_files_ext_index;
       public            postgres    false    240            ≈           1259    24702    upload_files_folder_path_index    INDEX     W   CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);
 2   DROP INDEX public.upload_files_folder_path_index;
       public            postgres    false    240            °           1259    24705    upload_files_name_index    INDEX     I   CREATE INDEX upload_files_name_index ON public.files USING btree (name);
 +   DROP INDEX public.upload_files_name_index;
       public            postgres    false    240            ∙           1259    24706    upload_files_size_index    INDEX     I   CREATE INDEX upload_files_size_index ON public.files USING btree (size);
 +   DROP INDEX public.upload_files_size_index;
       public            postgres    false    240            ·           1259    24704    upload_files_updated_at_index    INDEX     U   CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);
 1   DROP INDEX public.upload_files_updated_at_index;
       public            postgres    false    240            √           1259    24723    upload_folders_created_by_id_fk    INDEX     c   CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);
 3   DROP INDEX public.upload_folders_created_by_id_fk;
       public            postgres    false    242            <           1259    24847    upload_folders_parent_links_fk    INDEX     k   CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);
 2   DROP INDEX public.upload_folders_parent_links_fk;
       public            postgres    false    264            =           1259    24848 "   upload_folders_parent_links_inv_fk    INDEX     s   CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);
 6   DROP INDEX public.upload_folders_parent_links_inv_fk;
       public            postgres    false    264            >           1259    24851 (   upload_folders_parent_links_order_inv_fk    INDEX     x   CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);
 <   DROP INDEX public.upload_folders_parent_links_order_inv_fk;
       public            postgres    false    264                       1259    24724    upload_folders_updated_by_id_fk    INDEX     c   CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);
 3   DROP INDEX public.upload_folders_updated_by_id_fk;
       public            postgres    false    242            `           2606    24876 4   admin_permissions admin_permissions_created_by_id_fk 
   FK CONSTRAINT     ▓   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_created_by_id_fk;
       public          postgres    false    226    224    4823            |           2606    25016 <   admin_permissions_role_links admin_permissions_role_links_fk 
   FK CONSTRAINT     ┐   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_fk;
       public          postgres    false    252    4819    224            }           2606    25021 @   admin_permissions_role_links admin_permissions_role_links_inv_fk 
   FK CONSTRAINT     ╖   ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.admin_permissions_role_links DROP CONSTRAINT admin_permissions_role_links_inv_fk;
       public          postgres    false    252    4827    228            a           2606    24881 4   admin_permissions admin_permissions_updated_by_id_fk 
   FK CONSTRAINT     ▓   ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.admin_permissions DROP CONSTRAINT admin_permissions_updated_by_id_fk;
       public          postgres    false    4823    226    224            d           2606    24896 (   admin_roles admin_roles_created_by_id_fk 
   FK CONSTRAINT     ª   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_created_by_id_fk;
       public          postgres    false    226    228    4823            e           2606    24901 (   admin_roles admin_roles_updated_by_id_fk 
   FK CONSTRAINT     ª   ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_roles DROP CONSTRAINT admin_roles_updated_by_id_fk;
       public          postgres    false    4823    228    226            b           2606    24886 (   admin_users admin_users_created_by_id_fk 
   FK CONSTRAINT     ª   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_created_by_id_fk;
       public          postgres    false    226    226    4823            ~           2606    25026 2   admin_users_roles_links admin_users_roles_links_fk 
   FK CONSTRAINT     ⌐   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_fk;
       public          postgres    false    254    4823    226                       2606    25031 6   admin_users_roles_links admin_users_roles_links_inv_fk 
   FK CONSTRAINT     ¡   ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.admin_users_roles_links DROP CONSTRAINT admin_users_roles_links_inv_fk;
       public          postgres    false    254    4827    228            c           2606    24891 (   admin_users admin_users_updated_by_id_fk 
   FK CONSTRAINT     ª   ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.admin_users DROP CONSTRAINT admin_users_updated_by_id_fk;
       public          postgres    false    226    4823    226            ì           2606    25129     doctors doctors_created_by_id_fk 
   FK CONSTRAINT     ₧   ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.doctors DROP CONSTRAINT doctors_created_by_id_fk;
       public          postgres    false    4823    270    226            Ä           2606    25134     doctors doctors_updated_by_id_fk 
   FK CONSTRAINT     ₧   ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.doctors DROP CONSTRAINT doctors_updated_by_id_fk;
       public          postgres    false    226    270    4823            p           2606    24956    files files_created_by_id_fk 
   FK CONSTRAINT     Ü   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_created_by_id_fk;
       public          postgres    false    4823    226    240            à           2606    25061 (   files_folder_links files_folder_links_fk 
   FK CONSTRAINT     Ö   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_fk;
       public          postgres    false    262    4851    240            å           2606    25066 ,   files_folder_links files_folder_links_inv_fk 
   FK CONSTRAINT     ¿   ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.files_folder_links DROP CONSTRAINT files_folder_links_inv_fk;
       public          postgres    false    262    4865    242            ä           2606    25056 ,   files_related_morphs files_related_morphs_fk 
   FK CONSTRAINT     ¥   ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.files_related_morphs DROP CONSTRAINT files_related_morphs_fk;
       public          postgres    false    260    4851    240            q           2606    24961    files files_updated_by_id_fk 
   FK CONSTRAINT     Ü   ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.files DROP CONSTRAINT files_updated_by_id_fk;
       public          postgres    false    4823    240    226            t           2606    24976 (   i18n_locale i18n_locale_created_by_id_fk 
   FK CONSTRAINT     ª   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_created_by_id_fk;
       public          postgres    false    244    4823    226            u           2606    24981 (   i18n_locale i18n_locale_updated_by_id_fk 
   FK CONSTRAINT     ª   ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.i18n_locale DROP CONSTRAINT i18n_locale_updated_by_id_fk;
       public          postgres    false    244    4823    226            n           2606    24946 8   infectious_diseases infectious_diseases_created_by_id_fk 
   FK CONSTRAINT     ╢   ALTER TABLE ONLY public.infectious_diseases
    ADD CONSTRAINT infectious_diseases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.infectious_diseases DROP CONSTRAINT infectious_diseases_created_by_id_fk;
       public          postgres    false    4823    226    238            o           2606    24951 8   infectious_diseases infectious_diseases_updated_by_id_fk 
   FK CONSTRAINT     ╢   ALTER TABLE ONLY public.infectious_diseases
    ADD CONSTRAINT infectious_diseases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.infectious_diseases DROP CONSTRAINT infectious_diseases_updated_by_id_fk;
       public          postgres    false    4823    226    238            Å           2606    25150 "   patients patients_created_by_id_fk 
   FK CONSTRAINT     á   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_created_by_id_fk;
       public          postgres    false    4823    272    226            æ           2606    25200 .   patients_doctor_links patients_doctor_links_fk 
   FK CONSTRAINT     Ñ   ALTER TABLE ONLY public.patients_doctor_links
    ADD CONSTRAINT patients_doctor_links_fk FOREIGN KEY (patient_id) REFERENCES public.patients(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.patients_doctor_links DROP CONSTRAINT patients_doctor_links_fk;
       public          postgres    false    272    4951    274            Æ           2606    25205 2   patients_doctor_links patients_doctor_links_inv_fk 
   FK CONSTRAINT     º   ALTER TABLE ONLY public.patients_doctor_links
    ADD CONSTRAINT patients_doctor_links_inv_fk FOREIGN KEY (doctor_id) REFERENCES public.doctors(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.patients_doctor_links DROP CONSTRAINT patients_doctor_links_inv_fk;
       public          postgres    false    4947    270    274            É           2606    25155 "   patients patients_updated_by_id_fk 
   FK CONSTRAINT     á   ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.patients DROP CONSTRAINT patients_updated_by_id_fk;
       public          postgres    false    226    272    4823            h           2606    24916 J   strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk 
   FK CONSTRAINT     ╚   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_created_by_id_fk;
       public          postgres    false    226    232    4823            Ç           2606    25036 T   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk 
   FK CONSTRAINT     ∞   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;
 ~   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_fk;
       public          postgres    false    256    4835    232            ü           2606    25041 X   strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk 
   FK CONSTRAINT     ┌   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;
 é   ALTER TABLE ONLY public.strapi_api_token_permissions_token_links DROP CONSTRAINT strapi_api_token_permissions_token_links_inv_fk;
       public          postgres    false    4831    230    256            i           2606    24921 J   strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk 
   FK CONSTRAINT     ╚   ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 t   ALTER TABLE ONLY public.strapi_api_token_permissions DROP CONSTRAINT strapi_api_token_permissions_updated_by_id_fk;
       public          postgres    false    226    232    4823            f           2606    24906 4   strapi_api_tokens strapi_api_tokens_created_by_id_fk 
   FK CONSTRAINT     ▓   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_created_by_id_fk;
       public          postgres    false    226    230    4823            g           2606    24911 4   strapi_api_tokens strapi_api_tokens_updated_by_id_fk 
   FK CONSTRAINT     ▓   ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.strapi_api_tokens DROP CONSTRAINT strapi_api_tokens_updated_by_id_fk;
       public          postgres    false    226    4823    230            l           2606    24936 T   strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk 
   FK CONSTRAINT     ╥   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk;
       public          postgres    false    4823    226    236            é           2606    25046 ^   strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk 
   FK CONSTRAINT        ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;
 ê   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links DROP CONSTRAINT strapi_transfer_token_permissions_token_links_fk;
       public          postgres    false    258    4843    236            â           2606    25051 b   strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk 
   FK CONSTRAINT     ε   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;
 î   ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links DROP CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk;
       public          postgres    false    258    4839    234            m           2606    24941 T   strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk 
   FK CONSTRAINT     ╥   ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 ~   ALTER TABLE ONLY public.strapi_transfer_token_permissions DROP CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk;
       public          postgres    false    4823    236    226            j           2606    24926 >   strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk 
   FK CONSTRAINT     ╝   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_created_by_id_fk;
       public          postgres    false    234    4823    226            k           2606    24931 >   strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk 
   FK CONSTRAINT     ╝   ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 h   ALTER TABLE ONLY public.strapi_transfer_tokens DROP CONSTRAINT strapi_transfer_tokens_updated_by_id_fk;
       public          postgres    false    4823    226    234            v           2606    24986 .   up_permissions up_permissions_created_by_id_fk 
   FK CONSTRAINT     ¼   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_created_by_id_fk;
       public          postgres    false    246    4823    226            ë           2606    25081 6   up_permissions_role_links up_permissions_role_links_fk 
   FK CONSTRAINT     ╢   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_fk;
       public          postgres    false    246    266    4873            è           2606    25086 :   up_permissions_role_links up_permissions_role_links_inv_fk 
   FK CONSTRAINT     «   ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.up_permissions_role_links DROP CONSTRAINT up_permissions_role_links_inv_fk;
       public          postgres    false    266    4877    248            w           2606    24991 .   up_permissions up_permissions_updated_by_id_fk 
   FK CONSTRAINT     ¼   ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.up_permissions DROP CONSTRAINT up_permissions_updated_by_id_fk;
       public          postgres    false    246    4823    226            x           2606    24996 "   up_roles up_roles_created_by_id_fk 
   FK CONSTRAINT     á   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_created_by_id_fk;
       public          postgres    false    248    4823    226            y           2606    25001 "   up_roles up_roles_updated_by_id_fk 
   FK CONSTRAINT     á   ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_roles DROP CONSTRAINT up_roles_updated_by_id_fk;
       public          postgres    false    248    4823    226            z           2606    25006 "   up_users up_users_created_by_id_fk 
   FK CONSTRAINT     á   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_created_by_id_fk;
       public          postgres    false    250    4823    226            ï           2606    25091 *   up_users_role_links up_users_role_links_fk 
   FK CONSTRAINT     ₧   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_fk;
       public          postgres    false    250    268    4881            î           2606    25096 .   up_users_role_links up_users_role_links_inv_fk 
   FK CONSTRAINT     ó   ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.up_users_role_links DROP CONSTRAINT up_users_role_links_inv_fk;
       public          postgres    false    248    268    4877            {           2606    25011 "   up_users up_users_updated_by_id_fk 
   FK CONSTRAINT     á   ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.up_users DROP CONSTRAINT up_users_updated_by_id_fk;
       public          postgres    false    250    4823    226            r           2606    24966 .   upload_folders upload_folders_created_by_id_fk 
   FK CONSTRAINT     ¼   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_created_by_id_fk;
       public          postgres    false    242    4823    226            ç           2606    25071 :   upload_folders_parent_links upload_folders_parent_links_fk 
   FK CONSTRAINT     ╢   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_fk;
       public          postgres    false    264    4865    242            ê           2606    25076 >   upload_folders_parent_links upload_folders_parent_links_inv_fk 
   FK CONSTRAINT     ╛   ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.upload_folders_parent_links DROP CONSTRAINT upload_folders_parent_links_inv_fk;
       public          postgres    false    264    4865    242            s           2606    24971 .   upload_folders upload_folders_updated_by_id_fk 
   FK CONSTRAINT     ¼   ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;
 X   ALTER TABLE ONLY public.upload_folders DROP CONSTRAINT upload_folders_updated_by_id_fk;
       public          postgres    false    242    4823    226            +   "  x£╒Z█nñ8}N╛"Ωτ╛Ç√#V√░o3≤@└╔░í¥l4Ü_lw║█╒Igñæ"ÑsÆ╘)╫σ╪öëo║z X5█m╤6úl╞`ù7∙ú∞C∙_W╖╜·P⌠2σ═╧_7yWm╖U≤ ï▒j≈CPVâ╠₧C7?7ò¼╦a│╜√║⌐≤{Yo╛ ║∙·²&ë─Q@Γ╗8┌F┘6faûd ■φ/⌡u¢,╗⌐╝,?╒IBA|vÆ,;╣∩╩╧Ä%ß >╗Iù▌,e-╫╗y┴' ┐─µù-√╘φ∩δj°q=ºÇt┌lrτ╥^yÉù«└╘»/YM@|╢¢₧┌U+~¿≈╜₧+∙é` Lmé│Så|Σ8╝iΣΓ3ü ╒}ÖÇ1b6Fq0öφKúFp71ª╢{
Ω¬yBÉ07$ß║ª╛n≥rº╔¬!ÿ╠╢²rhIf[2F╚┘⌡4∩8ÅA▄8Ä╕kΩ≡
╫üÜΣ«&:°nm^ß'P╓▄ò⌡Æ8«αJA▄p}X09PΩ▄ò·GXâ[Z0±qK
M¡å&╫╨¿â╘╓Ar
Míα┘Φ%!:$╩∙3╚~:┘∩¬a¿┌F[!╟=¼æ&▀╔═ù╗ì▄σU¡?t}√\ò▓ƒ>½σ╝┤}⌐?≈R¡∞oⁿ╙>╔FúS-÷╗\╡[s
╩Θ εδ╢xÜ?÷m-/▌DΣ?Æh▄äí╢ Φ@°;Vπ&Θì ôC√≈ì¢Pd┐²</b┐0h▄8%╓8╡öƒÄ°┼CπµÖ,·²O"÷á5n╝èA»å¬y¼e0╛vrX╗╙ë─6╥╕!å╧úE[╫╙¢≈ÆòÜ╪J%░Éφ«kà╝Ñ¡≤╫v?"ê²D7─τ'B╜─α~_╒σ╔\áD╔
)╚A¥'σò8î*¥Æ êƒ▀√₧H±ƒ4nƒ¥░╓ΣÇX9 ╨∙─(╨τ─⌡9t─Bƒv║û╪«Ñ╨ë
┌ΦPj;ö₧⌐╓÷!Ωê┌Bó╔)┼╩BÑ@╛⌐═7=tzgM¿╢╗╝ûΦzó@╢⌐═6Ñ^√H∩ü<╗±e^δ╪Ze@èÖK1≈┌?∞ç÷üⁿ║╔M/∞¿·╝ü∩l`└!▄Çâfï\╕¼0 τ╠σ\,2í3T │└óE.l╢8á╛▄¬/ï/p┘â'6èxéα÷	é%(6l$9░⌡r╗⌡2rüo┌%âQε║Z▒í╫∞├εq₧╤£Φò5├]═░¼y∙£7à,âòJ¢ZÆZ-a|+v╡)á1⌐╒╒ûfT▒╦√'9¬hX╞
┬ìXfì┐╚√m√ä,`Ü ▄4A⌡°⌐mñ╫@ñ╢ xtfεHsf╙╠π3█X╩ ╩¼ )%2╢º
Bç:╥ÿ┘4rrlg`ÿ&▄4Mi┘æYtÉ▌╚¼npvlaá0\]pkv▌▐+Ç─	ù╕⌠╪0.╛╪"ä╗°╩Ä═bπ+Ç╜@╪╜Çïc├Φ°ë6q⌐δ<⌡ⁿîzΣó─»(Σ0,X≈╣l▌McÅUT≥xE╛Ä₧qc=±XGdP█≡ë≤î█─còFm┼╫╓3n¼S»τÅ▓æ=Ä┴╫ß3nÿçU-┌è»g▄Xw²¿╬; ╩b\╣=*[1É▌╪e79p9÷Ä²f▄0╕.√╝d«*|e╩[ⁿn(Düφ∩ l╞═UuQα┬ö°4r╞
A`s¥°⌠r╞
E»▀	╨vëm╗î@4╪╬≡░f|ª½nZ>vs·σnc╟∞├δ«█▌4q╨ ;Å▄σ│r@¥c⌡O╩fk&Ω₧ay¼╢â-ICBb7+D▄
_τR√s╓╟A▄¼qAt¡╗∩╧YaΓfà½nªûm1╢
¥╛y$▐R╛MHÿ¥╝⌠7╣╤;«≡⌠)ê[·⌡∩nu*ΣΩ∩B≤ΓgI╚R╧≥
n∙▀±₧╓N╦√Ç0/Ñ£(╘ █J╢<'╟[ÿTΦ$$╤Yrn}[q9{M╧Γ─¡g½nK»Ω█i;pπ[_àA=i(ƒg╞φ┴δ#[B┬( n}[√┌Θò<─¡gδ▀5╜ûoº}p└g▀╛à╖╖╖ ╣{`      G   Γ  x£ô█▒─0C┐Q1w╠█εe√»πJÖαα∞ftnnaÄ░∩BZ2'╩è╣╨╓╠ì▒a¼-≤Γ┌e╛x÷ÿⁿâJεµƒ¿├yº⌡¥╖O^╞α▐╞HR|îæΣ°#I≥kî$╦ƒ1Æ┤ Γp≈$╕öé¬⌐╧@╨+5)tI%╩}Rë2AºTóLRâ~)ô╘á]╔$ìå╢Äñ;):╧âVK█D╥½╘╜É4;┌6ÆnE≥A╥«P╛H·╦/ΩX	µEkó┼A±pEG±> üΓ▒ï,@[ëà+╤óQk%ZΩZëïzVó┼Ek╤Γí▌Z┤<hûP┤t4OY┤tYïûëf¥EKV|¼E╦F»╡h9Φk-Z.·YïûslD╦çßaïV├F¡├JèVü)╤*1m≤╒⌐0l,╤è-╢6ó╒`«ìh╡ÿg#Z]∞▒¡û¡ûφ(Z;û▌"Z╢lEδ─╢¡h]╪▒¡╦N¡┘╙╫V┤^∞│¡/ε▒+Z?\6ìhsp┘⌠óìπ▓#E¢└cK~█─+{Oß╡=üº±8'╥MèFE╩╦Y9|Wïn∙└╖╡ΦùSDA-┌Σ⌡∩
hF┤hèª6ò╣╦╤
═¢∞]NùåΓî[°²°⌡Zî┴      /   ╨   x£uÉ1Ä├  kⁿè²Ç-c╦º(]èk»╣6═61Æ╗D╩∩ââ▌H∞ 1Z²ªò"£∞▌y┼qu-o¿┼7·s╠`╨C╠Ç▐┬=▐pYαJ()RßL"╬▀╕SC?î¡ε█QâεÅ²ß¿ºεá┐¬ⁿⁿôW3¿oδ$─╜ç╩T`⌐╪╒┘╢ª╦Γx╝Éτ═Æl Öä+Ö≤+S¼E
còù¿Q¥R╛∩àe*≡_Tvφ1█■	3>2ë∙ï╚╓⌠Sò²╣kÜµq~A      -   Ä   x£3Σ⌠ß≤÷ßî±π╠,╤+╦╬,.qH╧M╠╠╤K╬╧σT1JT14P⌐ê≥)═«22╙w╠	═v⌠r╦¿p7
/u╔)≤î2/*≥≤≤⌠s╠H6O1	╧6è╠H1≤⌠▓t7	D%£i ╩╚└╚X╫╨@╫╪P┴╨└╩└╥╩╚D╧──º8X3Wî ê╣*ⁿ      I      x£3Σ4ä@«=... ╠      Y   
   x£ï╤πΓΓ ┼ ⌐      ;   
   x£ï╤πΓΓ ┼ ⌐      Q   
   x£ï╤πΓΓ ┼ ⌐      O   
   x£ï╤πΓΓ ┼ ⌐      ?   <   x£3Σt═K╧╔,╬P╨H═╙ΣL═π4202╓54╨56T04░2░░24╒375┴)πD\1z\\\ ┤▌=      9   Ü  x£òUMo█F=█┐bÄ- ûö⌠C7├FiS─Ar╤eIÄ─àù;∞ε╥
{Ω▀Φ▀δ/Θ¢]3╢]
╝gf▀╝y≤╕║╕∙≡∙εv╣·∙b}╡▐,WW╦═èVW█╒j╗∙▒┌¼╫'┐»╢δ7█7o½ƒ~x√*~│┘^╜¡Vδï■n$ê7Å6îæZ┘D╛°MbóF·^<┼⌐Æ⌠q╗≤K·à9ΦßF╞CºçO6pδ9F}x/1Æ∞)Öÿÿ$P∞┘╣¥▀∙≈ê8[±^SΩéÿñÅ∩╪┤ªΘX╧╫°╔°ûc}╛α╓Ü:6∙5;╥é╓/⌠:αo─I0╔Γg ┘[α⌡]╬%>r½Å6¢L┬O·bτ∩9X	'≡nφ~o¢╤ÑëΩ└&u(ÿδ$$m[o)o^µª╙└^jδlÜ2╛Fⁿ~î└û)Dw)╖v▒√²bI┐róG╙4╓gX╟Ä=Öº_ÿ,ÿx4╓Ö┌ü/íI╞*≤ù╠D&æ├α¡¿τ─ü╠`Bó}É₧$u``Aÿ£'ï┘t<Q+■▀┐ Iê╪(7T3E█<ΣÜ_⌠7CCÉüâ¢└bRD╜ë╓╨M6N	O╞7J
 zA?`└*F┤¢c-┬E┤ $4áÑ"ºäñX"D"╞Å╠≥eΣ`¿@á;jΓ0=≡^╤ç!≤s┤╛òú6ª	ÑΣU(
╘A?æFg─╤ªÄóÿ!δhö-¥°≤╩M_"îkñ╖¼ì▐¿E(îuü¢▒ΣΓ╜îïù^;╚²6║│J<≤_8τ╝╗╜&╤₧┘╤Φ╡╧E¥^'=τ"æ▌~iúhτ9#púWVtnWΘ╗┘╛╧Q┬≈▄ñ,σ9ª1ú╢QO┌!▌_╝_▐╚τσÜr⌐J╒ƒW~`0║RA5¿ThJ╣≥h¥#■
QX÷
So]½┌ΘÑσáÿ╟┴Γ$a"─µ²╚╘òr=Påτ?Gö$,Jc!ññ+╘c∞╜ôú║╚Q^≥¥5≥qÄeC].■TX	╖YÅB⌡║ⁿ╨ç¿╣#ì┼╒:#mi⌠¡
[╠ÖX═╓jf$gö▓╨Zy4▒Qß╠L.p05V╒└┤╝mNÜ■ªÆ┬bΦ**<59-Φα½ENå╣ƒÖ¬è«²qk&α║É≡<π▄╚Y6▓√▒:ü±0äWñc²äß╒Ω3Gô»é·@*rsX,tîÅ╜ìjM¬óΓ*Q╒éÉDª╓╔⌐fUiì%₧Q▐┤hΣÅ 	╩[ó¬╬▒┼ëè+═"⌡*J▌¥┼⌐ìü▓36vä7σ╪│÷┤x┌Ωÿ7≡àÇ»µ∙W╗ì╡╞
╨hqSu╓åmé[╞R/ì┴τ[÷Γö@'*ƒ├h[¥w5ô^╤IRJ▀╓ò>fÄO>î┘Fαÿ▒7α▐Y¿[┐~!YT,`▓ügùYâü▄░F═╟'▀)$H HP≡╣ µ|α¬╞º±T╜Aù%σ∙g*_G┬L∩ÆJ├÷╛|╩j2bs║°£ ■XÉⁿ┬⌠║é⌡⌠lì╓#┘╨▐±W² ╗ZÄerz± ░D╡²W₧Z]ε¬╦╦╦  !≥J      [   
   x£ï╤πΓΓ ┼ ⌐      ]   
   x£ï╤πΓΓ ┼ ⌐      3   
   x£ï╤πΓΓ ┼ ⌐      K   
   x£ï╤πΓΓ ┼ ⌐      1   
   x£ï╤πΓΓ ┼ ⌐      '      x£φ]²n▄6╢ █yè┘÷ƒ{╗mÜ▌εu¢╚▌▄─H,ë1É%╬kì4ò(╗▐└└╛╞╛▐>╔≥√KñåÜ9ôä╪lmïΣßy>~ç<"OVy3ç┼4-
4]&E2∙{τMò X¬Rt╖⌡ΘiÆ-aqz║╒╓5«p≡a▄└l|:nòî╟5@≤z|·a|╒Σ╫╔U╞º¿j└ßxs*²I
Æ*]ΦOVÿí7≡ƒ°∩π╟çπeï_!╚io)b]d`û49zSVΦº;O┴½*.;{≤≤°╙(╔öP╢∩╞ â ─à9¼╔oπ<╣9nâ╦]£╒ÿ¼·√7Σ+bÆä╞R¥Vp┼Ωì±âU₧ñ`Qµî=ⁿα╓PδàP╥zis'Içsx₧T	P╒~^╡:├qmtó≤?K≥┌x·Ç╝A▌\²RΣb\
┴»ó2╠½¬─JÇ p░V:½∙░A┼Ä⌐b£ⁿjÑC≡kÉπ╖*╔ƒmNΘ≤¡y4═Lü%t∞`¢≈"i▓3º╘¬┬^î≤┴Y?║∙^¢UµτU┬½N╛╟╕ú∩W\╕=»ªD╠`U#ƒXΦ▌÷o≈;¿┬}╜█⌡∩@$weâ¿±`┤▐1º⌐|ô4ƒTm.∙½╛{≈ü)ÿε╟¿╖ryhÜεéüéú₧fªTL╦Φjo┌"W
í÷éⁿσ²²AI;=x  {⌠⌡6áèP╖ßö44C)·fm╒~ⁿ  èìs[$;╗÷?£pÉ┴)3'o⌠∙0╛1σ═Φ╝═ó^<º&² ╦W{ (+╪▒∩6xu¬Γ7╝╙èwⁿ▄F║@ƒ╤i Ωï░$┬Æ/ûpï∩░┌.`"ⁿ≈°çX╚(áí╦╢ÜJâπB)ª*{ü╞7█ ìdÅPy
Zï7▓ BÄ╜Çƒ£['rµΓö>éEN8l∙+u²7α┤j¬pÿ/E=ä╒<⌐╤█┌τ±┤╥!ÿ5╚-x}&Éⁿ▒é¿▌â«
çs¥zÉÇ└¿Wë╙*╚▓AäCÅï_eFö┘ì2MJ¥U/öΘåÆ:`░╒╘≡9ÄåªÖo5≈ QìÇa│ZφuCA┐qá╪owébÅⁿ╗æ«:âb█╕/┘_ÆE.╘╚Cæ┘╥QqOtk╤¡E╖╓╜º#┤EIc╨╢Ä≥R▌╝KO╢q¿Jèz*≈:çY;Γb╟&ïqA!.(─à╕áæWD^gAA╣ü»*╕╗ù╓∩bv.k!ï▀φv¼ x+╞eä╕îùó3ï╬l┐ùÄoΣ'X¢╙╙fòùI6Ö╤±ö╬┴Y╫÷baòá┼≤╠┼/Σ╗A:î├
KÜ¢CZ≥@╛J÷dT0╧*╖çòe─╕╓_X$Äu╧²9+x ╢EgüÖªXñ|R<ÿGΣæKD.k├piε╣	φ~+_!b[=tû6╣¥r¬Y=G╨,¡ï│├Nî⌠²N ╘>_qöEx┤≡(!├\α	╜αºQ┤½┌╖·▓ÅëwH
≥%Äñ┬Σ-╠▄₧¢┴áá┬▐└∙┬9∩╝d%Θge╡LÉ»±ó!xT┤├ ┌"⌐¥╙Lƒ2êîp╚z4{(m╫α%t¢F·|╓8ß▐ÿât£-@₧r░ #ä¬¬▄ëº≡π!8ct├Ä; 7▄╛u≤ºòs▄üF>≡påH╗s═└╩:ÿA∩├τT ö.åUÑ!9╫{	î║y».3₧∩dáπn╡<Γ|HσsO≡¡òπé4≥1Åüx─╗±v!░z»É▄ì8"l-hQÉ▄╙+≡δ(╘Pºδ╚	ü∙{Φ>6Γi5p├┴≈≈φÑ├┴║Å╒É~¡ú╪p«≈T6║┼âi²=¢}M W*╚W╣┌■~=!O┌╬jâ«mÉ<δεóYπÉ]╗îï╬╓╬í⌐"	ßítBSV0H4─)@Ω√"╥ñ«o╦╩│▒╞╦å┘ûÉ─C°¼ ╓─s▐µ┬ùΓ¿5╚ ;√	;m█,Γ03▐╖hWΦ9║Θ±└)3¬pásσ$⌡V»≥2╜v3*èå`S╤φx≥]îMbl▓≈▒ëåPP÷╚ùΦÉª
⌠Üp┴k═7:Ä¿╤lá≤k╞çù¬╢kO║;û{å≡°i1σΦsèI&98cqPú
b^ Dªa╡⌠t^%┬H[A╡éît&åªt≥Aq≥rEτ.âu*└ê¿╠τƒ╫5╟╫Σ¥1¥T,ªê²Ä┘╠»Æ⌠Ü+°U╥á┼W╝╔W▓7IIçtbq╠ gwrN/╔Z┼½▓╝ε`CT9¬oÆ
⌠aG4u≥úÿÿùσ£√7╝BÅ₧Yïu²B┤h«║·e·⌠K[8√σQ∙q¬xX┬┤*δrå:╪╕àEV▐╓}°Éd╜¼L░╜╦(Φ"─±╗¢Qú╝ëΩwï%XUû]⌐:=:ôì╝o;┼▒▌┬'/|╙%ε7╫}z╛Y'█d╥┼Ü▒M}ç6]x_⌡öL¼&a9,░ìäE▓J.D'╒4çê1╟╕oJ∙I▓ç5e+-τDeWë_Σδµ*+ë[$ïEw∙τ$-ù~y╙u8╞╘ Θ╥Rüî{wƒ╝éÅUä]▓≡.╞X≤ôìε(ñ≥π6┬╞ΩßµÜÇ╞3N┤'7rt─pΘúö▓┼o╘┼⌠.L¡âàεn9 D╞,▒eù°≈ßîSδ₧«C∙δ;╩Ωσ╕à>NÄ²hé╢┴héå▐S}┘√wî	½┐É:û°o&VU∙j⌡]æR┴FΓ[╘YUR√╦a╥∙HC?╢┤8:O
É╦)╞ATyTüU~≈┐ñ╞
N`9f++LLE5╥?╪~ⁿÜ░2╥XYbòOµñ│V?■îÖf#┤H╨ú╧Q^╓⌠ùJ╢Öî▐öUu7J«08Ñ ⌠├W½▀┐/≡?Lπ'ⁿ4+ï ⁿδ▀htKj■i⌠L(MèL▄ îfe₧ù╪o╬G─NìP9ó#d÷s╩⌐bÆ?ⁿ∙/ú╖»_î■ⁿπ_╔╣ê!_╝·█//±ú∩ïER\╫≥l,τª··Bτ<9¬╦╣J ╒P╓C╬┘YÜûMüFc╞╠╤7º36++<£s╠ °╪£2ïΣÉ1τΣ╪¿╙~G▄LFτ9H≡dÑ9L»G°-╚¼╤╣┬íLy;1h│ú8ñ│⌠≤½g┐tOÆ¡y'~═K▓¢ñHAF═°{#GïÖ∩ä╒T╝║\äpêÇêΣhæ¡╟Eôτ«f╕b+└┐Sc╡DX┬VN¿ û%%q▐╪ÄhÄ╖∙á╨╪,╨₧ìç▄Pßl{k└S÷ {¬o╫║┴╪╬w╨5Ωí'#°8òeC¥è╨â╧╕▌▓¢φû╕ï±É╗╠╪W▌╗φJ╜D╗¢ÉwÇ⌡YJ\¼╦▓!DF#║;α╠Öe╕?₧B√Il╗¼*0\╝HèyC¥3╧╤¼3P╢ú▌I▄çë√0q╞│úcA
nIDπ┌è1≡ú≤Σ½╨╚ódG≈Ämiq[
█<fjV█Ü°╖{6╗┘╚ƒ5σ8q%ñ≥áßT<u┼$só/î╛≡≤≡àR⌐╣▓l|Γ╩·╠Çô¡\I'ÿ≡4█3heâ:é°5±τp)^┤⌡╤╓æ╢₧δ/WònK∩
W∞╬┌v~│;╚ⁿ(▀╕ ┤╗Z┤■{a²?╣#╗≈∙~▓╧σ╘δç╜┌U.╣x╢«Γì¿.D╕░τwU¡┐l¬ugjÄ╚√B╪ÖSS0ñ ¡^a╬û≡ƒ<├ä
╧Ωü7α\éé█^Vû4¿|UAî\⌠ñ╗╙∩¼N╔╟▓&■┴▌¢Pâ╠î«≥º╧~!°┴"ⁿ╘"î┴ES≥2╖ \τwo╥╚2┐ππô╤±ô╤±π╤ α ¥≡╡ε┐╙Zo⌐îα~ƒ| ⌠╗ôôπ∩Nowu└2¥Lá6¡q╦≈╟ôY┤5X,@iÖτ,╒µ%_1 ╡ªµD┬bF3T∙₧δ½╕-E⌐±\5yR╜┤Eé*╠╝UB¥	╦{┘ΩΓ^╧╗?ΣÇ≥òJπ»{─Q+ydΩ&√éì╓!Crt╒@q₧àUæ¼╘"<?W
b[░j▌û!Ä1√bL2╓ïáÿô╙%Ä∙g!DRtïPü▀Xë╧Σ*≡yRßùD▄╣r║┐╒tÇ╓╨ß8t%πqO│?Y■┌ûLè▒ZU%₧┴Ä°├m░φ│╡╜wù┌J╡│-'_ü\d∩╔_O▒I.ε.╩Wá2}âgÇ╣KQR═i≥+╫┌í
,xGD-då▌pµÄr├üv2Z@≡i3├s╤£/[Ad<░}nⁿ%,.îJ½
▐╚Σl█Gε+¢ÿ╧kXd4╛∞é╣Ñ)7y╙i4p╤└Ejα╝*EûD╩Σ¼k.j\█hëKp╡B$±╩<4km▌Ö╙Oh!~0╧╦½$'GÇ│\oSgtCπ╫sü7-
[╗Oc░t¢[1C½e⌠kΦ3%°╨╩kñτ┌¬┴2╖Ñ▄lñ)zRφ⌠⌡d╪5⌠)╩┤UNN$kh∞=	▓fè╛╠hyI=ò≈Ñ∞╤º;ùâs,vx│IφæsvD▌æΣ╣+Γz÷%ºyUb╗ôhΘ▌ôm╧Ç╠ôa)└l■?■»m7à▓;-µa█Φ≡î6¢2═∞╚▌╝║+ô1hóZBτÜ¬ês≈ç═{A¢é5├·╗ì┴f(öÆ╕t┌¿│5öÄ.6║╪Φbúïì.6╘┼ni)╖│6╞R╢;║µU~┐╤╔╩û╤φ╔╡î>ƒ[├Φ╦»[ú Ü»╜}╝ƒ±4¡▒i╔┬VKD╬╒ε)[√∙r½∩≈n║ε└╡{Ö¼V\╖┼£:QS{½╝╟Ö╣√ut╗2"╠▌6╖┼á╤Es⌠I¢úφ!ü─Kδ!üÆ≈nH ñ¥7├░δH^╬δ├eΣ ┤ÆC╧Vp$┐╪5UP╤╢⌠P┤òQ'g⌐°'áó╜ñ⌡è╘?@╘└14æW'B╗óYéJ:∙ïkÆ∞¿,r"σ│&╧Å╪-πD°ÜòKÆn⌠v¬oE≥^┐
}7âΦèò┤½╧▐=|+╔┤mπ`δ╝g≤≥⌡6D▐░ñ╦¢┘╖y=y╗VA¼H╠²xáM&"¡²assñ
|4≡╤└G▀"│=v╒ìCÇ╡îI7è┼VäÆ=Zô
i█╝ε╝í│≤τ╠^ìzeyD╞m%Å║▓è£|F∙EZ⌠±@⌐1J╥"Ä┘+6wçcóN╣:╜C╫u╘;√═/#a═Öçà╗¿gáZ┐R#jz╤ⁿ»αâ⌠VWût¢Ñm╣nQÅ'╖α·#"iSÇ╛8q╞>▒╣5╬êf6Ü┘hf≈╧╠n²Zè·\┌▄
≈ä█ï■ë╢F▌íÅi:·┼?]R╒a┐:#!??1┌"▓$2ΓÅ╜bs╟°#j|╘ ╠  °û╞∩┌÷_
Y#<=ñ)#≥⌠)z°┬ä▐╙Σ╥Ráδâ%█ⁿ■.CîESbà«î│╜┘a╥ÖÉ╕èäΣò_É½Ωâ≤╖╥ñg┬╫-╠╨B½▐ëτp²Ç≤Ω╤`VÆf┬>╥%⌠ôz▒∙╕⌡½%▄fè╪Y*╩â.ô<╕ySσ¢≈╜¬ 9*σm0
┌F]ò╛i»î┬T╒:º╘vƒ	xkY¡2▐±ëSn╛─z-
▒mù)╦êcπV√<AN±$6Æ8;@°Ç$Γ╛²a≤₧C■ 6\;>ë"D%c╩Σ`║┬é0Ñu)?y│$>σ▌X+&	∞E╔uZ┌üM=>}╙╣╚⌐╥0j|ö=╘Ti5≥╠Eç╓
ó@¼ñï╡₧A░Iw û▐l╣1fÅ8$ΓÉêC"∙Æq╚÷╤(7ô¥üº+2╘bM÷╪6▀╥g╘▓:BK9-ú.£¡╤e▌┼Φ¢÷]6│,<½╜ù&▌=≈ä;,,╧3º¡4?,r┤¼0çJy║└»]±P±{@Σ┌╣╢;m█ä┐═²!W«¥⌠├DXδe&Ed╒KIc(░Wlvç╠<≡( sT^ñ@¬╨5╨5¿╣I9Φlxúmî╢±╙▓ì;Ç'ΓÑ{M╓B⌡nÄw≡½zöL▐╚c({Z3C`j»*2⌡∩à ╘Ä│*Öí│";o«rHb	╠≈IOù╔π╙o{├K╧W╙k┐ôÄNv»╪▐gì║│║│╜û≤dä═╦ñ	&Å]sK₧Oeu═>??~·ÆO░Bv]öΘFM▌√°½>≈╗8└xO╢▀φ╡╧Γ?┌h░Σ╗╠¿c>║Ç}gs≤T¢¿Åƒç>n∩V┬3_oIVp▀«g!R¼äá÷Σ┴╕╩#╙₧Sò|Wo}¬╥╛`æ┬⌡u¿ot└½╡YΣ░6╦;8>εû╛÷!Fn~ΣaM╗Σä█√Pó+▌6╖rÑ╤∞D│≤⌐ÿ¥φC╚╣mkq╬ª(┴T∩hx╒s≥w3╘╔▀k╫?≡ⁿbc^úd╣¬Uµêí]τa¢:╕╔Iç;;╗z┬²╠■Φτc╙v$;p>6'╛∙)╤≈[ƒ3²Ç╤ÄPÑû÷¥M!Ü¢▐±αT½ÄnLvu²C⌠ ╤D≡izÇφqk╚kA÷ª╕U^V░éººYÖó▓Ü░d`}÷¼e┴XôÄ┤N╙▓Q¬ÖiÑ₧ë┌²╢εä╢[ah`Φ╚2╚²╞FBt9ë	 i╞?|v V∞¥{₧rá£,Sφv0╤╚.╤╚┐╡ªù╓lojσxvJ█╢à╘@┌D4│*ç₧mß≡±#╟kñw)╦╜║V╧5φ║⌐Å≡ⁿüñô÷ú^╓W5ƒ≥µ2σΦ╦Æ»vì╢¼=ùu₧I"├ê]₧\╟╖╕₧W δ╗σè£«½╩∙zâÇ╩┘╠╝ WÉ╧░╠ÿÇóÉî$GRÄ╥h╩ú)Å*°Up{┐α£É⌡>"╠Æδ╛├Y¼º59µ4└Ñ╪ε│Å≤É▐█+«╩)¢I¬íòA┴δì;T£╥? t·x3╔A╝^4±╤─GE	Qöd²╚\o}█1â▓│ΩÖf\╧U┼ôzP^²å{>x  {t≥⌡AZV`╩«GK┤8° ╫Y╓Vâ╩╫⌠:R▓└╚àïsL╖Θ╖∞╪%╓σ║Γ⌡Ü]J┐p╖z{z└fy╩çh╩w╬ºRε	π▓öLgM╧?tFÿ≈
ⁿW
┬óD▀÷¬╔»uú4âΣ{r²ë╛^╚┐T┼»≡å~╙|ⁿÿDv░°é£░┴Éà«7eà¿L9₧┐¬Φε°∞═╧T₧°ç┬ö)HWAæÿ╥i└àö╗°¬1Y⌡7_ët8-IA1d¡─cuN┴é│JH█├· ä┤>┌╝	╩!∞	
╖╣ú╧ç`ÄßMC|6{óhφ&°┤yΣ%C░(Içphó`¢K¡tN
≥!▄Z░▄fW/é_ô~├Æ│┘Uà╜ÿσ&-╖:∙^
Ti≤¬
ßU'▀c\╞≤îδOw;α╒⌠ΩVy x╙n{î╖√Tßâ╛â▐φ·wá∞«l╪Z,{àwΩKgΘj¿/~ó}╡,∞</╕<Tì4█jf┌Gce·Zm-▌ì/┼╝c^[≡¼+Å╬╦\√fseá\)┘ x8D$]╣	ê┌Åφ3α╨╖Z~R╣╢π╤1;.╟⌐·kmùδ╝╦=πΦçó·RⁿÉa╧╣é{╠∙a█iY«Is>Ü╬I∩╤≥▀nε¼╙#┤WóO°°>A¡t┘▄e₧═±aⁿübL}A⌠√Ño^O≡~≥Φ╤ú éP&<      %   ╖  x£φ]Kô╙8>3┐b╦τ@M&@1╣Q└ak).╠₧v)ùb╦ë╟≥Z≥<á°∩+┐╞v,╦/╡ç$:0╠─╥╫-⌐√δû⌡╚r⌡Γº┼╤╞╟╠Z ≤╙
╨[kï±à─vhäm╞╙ƒÿslÖ╡░HαΓç┤ⁿ╖àσëçdⁿà≤Ω╟√áåF\Qï?åΘ∩üß=xéäómV0î╚EÅ╓ÜG1^
╨∞ô_╫┼è}~C¡u√■┬
( "~It/Ω┼║`╫Z{╚g°╫ΓIà[⌡ñâh¥hJ)┐=ES┴▀!?╞Ñ Äx	o∙4╪ªMö
 lεHDâdÇ ┼p┤╒ ¡" 7α{╝┘Qz{¼V¢■8qΣ╧a┤;î\▒R╘wFâìV│╜╦╟L@É¼X─åRú@»╒"wO;─╤₧0FhP╖█÷b╢░N─▒komΓ┌▐¡U╡h½÷╘R
┤π╨U ╒₧
ñå+Θ╥qaE╪├∞▐d²ùC╞,3Ñ≥∙ç%½JâÅ╪╟<⌐≤⌡╙═_■■ⁿ┘╥╫h²¬²╢ⁿâ.·Æü2	vê"±7ç%	o╛c4«àv┼	ålçCù≡£└äΣ■ê*²ò╕'iHz▓Aa≤7?₧≡┬;$±)k²╢█ⁿ║πSεy╧¬D¥Ö*.╔±GS·<u╥fkü5y┐α½╓ôÿ\2╜aeä^≡eDC╧(öx$b:ƒ⌡╝îddáeα=">h£Bî▌╙╚àöaå╣]H▓9╜┼á⌐Dä╖$Ö÷Ñ	╕4┬∞$w╣½╪ü╢)A)eπSτd┌Q═YRÄqm█mA-█ñºƒVD╘╟╩┤"-01¡╚0⌠ª#⌠éO+F4⌠î╥
ΦH∞P▀┼╠ëH=═6┤{╩┤¢┐∞N■ÑyO∙6èìªα&Æ."₧¿#$Ol┤!σc#MΦ╡6Σ8ÿ1xi2Ö'&÷╠╝ïB"fä╧½äO<╠BT▒Ü
┘■9¥æM╕=τp█╜`º¬í-â,πΘ╙|╬╨l≈zDi°┼=Câg@âΓg└äK⌠Özö¥J}çpÜIoÆ╢3╨▌ñµƒ╤¥╚t─L╠t┴─╔ëô╜τφ╒⌠FO╚┘â«6╠S═<┬╠#?≤úGZùïπ╨ºH°ZR┬÷¿∩
╟▀┘i┘║V'>ö)£(TkU»┤*\┼µzíòµ!C½O/┤Σ3NZ╢#?ñ╔τ²≡â┤)∙æ i²z╟ìK⌡Ä£{FΦ_F4εîb⌠
∙<┘╡ù∞╫▓≤s.p╤
üO∩ë+XN'+J╪	ù┌qP┬o≈⌠╨╬▒Σ0 ╥₧└:E
╩\F$*{Σùûùï+
iS╗æ5┬w▀█αbΦqS√ùa∩1G" @╧¿&K&q7ë√¿─╜╚S[Ω╚α│2y≥ε╩≥╩ⁿQÖ[
╤Σ┐[¡[º⌡9@7╬╪ä⌡ FWµ:E;╚vJsM.½±∞Fµ(É╣Ö	&0îd∙.░}Ω ╦úBÑ└h≥¡bΦb▐╤zA╥εΦå╬=Üc åOÖπ░{╣»^fBJ
▓É7E;╪ö╘,╤⌡áG│Dgl"ü)uOºÉû▐π£π4&*sÉ≤6ΘAƒ2<{Γ<½╕ôºx:àg⌡▐╞3N#`₧5≈≡£■⌡5s,╟¥α9
<Æ¼║╧rEN.
°·Ü9«╚1Q≈öú«KN█én■pt╠-Ωδ
╣ú⌠üî╕úxFⁿ╒┤ßª"b╟ƒ░▌s½qèI'∩cf╗äa─┌▐I
Ä_ßô`i[Θ¢¬'Φè▀╘åƒ╜èbt«═▀∞qr║/E└▌├Å=»v 5£ñd[ª0à┌╦68i┬_h>½ÖC£ë╕&ΓéG▄PÿsNªÆ0[<[ƒ t╘qAF╤qM<ú╨if&å'Å₧'¢_µÆ¼│┌>	n[╕SUú┴e▒CU┬Éα«ò>Æ∩[WΦ│(A╗▌òBhöæΘ[ò°u?²;UI⌐ml\▀PU!▐∩┐~x ±S∩P╒(╒è¡2Ñ~█`phX`▄P⌠-áêåσûöKπìÅ([t╠╢xtrOúp3)aëS╢¥J╡ε0«i╓ù╤L!┴4æ3næΩV0J_Y#S%√R╙Ç>σ⌠Ev╪çëÄß∙ÉPiv╟L?╫M<]╧n╩¢5│Ot╫╖v├÷e5Z«1Ωù9WYk,¬î6█╘^╚Spio∙φ╝(╒ó¢'⌡╓@ΓΩ╕WW═¼¡aó┌G╟║φVFæ╡ƒE╬¼9a≈eb}⌐│D├á[½
┐«╦w¬N┬ùq¬▓)Ö°nvφ⌐N;┼╢+╒¢gAFvu)»&∞E╗zφGG+ÄÄà╗∞è"¢²?ƒ░YI9╗ü+┬~·jrOúp╫┬╜▓Æ
╗M
╔o0;¿X░HπÜèµXZƒ╕vVIåQöφuZ▀
⌠┐Γ┐úr╖ó▒É≤└rlfÉ}≥─#╪▌=Σw)r»f╣▐_½&xyüε╩▓l¿4█
î"ßæ└╢g5)xw3ñ{4R╔öÄ¿Fπf#Cmu╥)╗R{Åª╕┼)D┬╕èz:╗
Af╔ΘgâæñⁿQ╕╘!≈nUñ(Φ$├ε&öæ
ß╘┌╞Φ╝g:¿w0<╣═┴<â6.┤░kíú∩2b;é«²
φ4mV▌æâ¥z╨╗öæc3\⌐ú\4&*∩├/ç{mLÉ╒└&ì║╙7$╚P'∩#╘=├¥▓▀é┴}}&∞p;fZ╘┌¥¥▌Tqé┤h3LfÑZ7Ö╫*╦╠5/╨½╛4═(XT┴!Wd╣ênó▐g¥┤r6@═ú`á2σΘΘú"îÜ┼Ç9t┘¡É┘D═2⌡╟╖_/«.»V/ùù/W╦?û╦⌡¢╒zu⌡Ω▌╒Ωv¥k∩⌡r▌═¢╫╪y}ì▀^┐█╝Y╣╚╗╛|╖\]ⁿ√ΩΓΓΓ-┐nx      #   
   x£ï╤πΓΓ ┼ ⌐      7   
   x£ï╤πΓΓ ┼ ⌐      M   
   x£ï╤πΓΓ ┼ ⌐      5   
   x£ï╤πΓΓ ┼ ⌐      )   
   x£ï╤πΓΓ ┼ ⌐      A   Θ   x£¡╙Anâ0àß5£ó└▓íIo½n█ ¢)dT#ÅQ»_¬V]á$NH%Vo±ÆìM6÷SG∞▄$ñ1$B₧E}/j└¼╘eU]Tµ┴hº¡3╡│╒┘²≡2yyíS<¬·▄ßê|·╨¼T¬ñ} ⌡╟Θ╬■▄ⁿSL╓=3╓qU|ôè╖>t>^>áä▒M∩#vió#ëV╒m¬ÄP Σ╣Ñ0@£≈U╠>┼r≤ⁿ/ö╤îΣq; 9Σ')Aubjëù╫b¼╙F┘%≤7 2µVµòùO²:Θá≥< ]1      U   @   x£╠╔
└@└7█{⌡Æ■δêü4╝t├@╪D▐┼B┘üa'f\Xvc█âc⌡óH¬o╘½°=$7╞╚      C   Ç   x£3Σt,-╔H═+╔LN,IMßtIMK,═)Q(╩╧IUH╧,K═S(╔WHDVúPZ£Zñ╟ë"╞id`d¼khákl¿`h`e`aeh¬gnnåS<╞ê╕î8Jôr2ôqX[Üç═Γê∞&[óëZXÿδZZBmî╤πΓΓ J│Ec      E   
   x£ï╤πΓΓ ┼ ⌐      W   
   x£ï╤πΓΓ ┼ ⌐      =   
   x£ï╤πΓΓ ┼ ⌐      S   
   x£ï╤πΓΓ ┼ ⌐     
