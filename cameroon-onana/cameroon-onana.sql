PGDMP     (    $                 {         	   datamodel    14.2    14.1 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    67642 	   datamodel    DATABASE     e   CREATE DATABASE datamodel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_France.1252';
    DROP DATABASE datamodel;
                postgres    false            �           1247    68190    common_targets    TYPE     �  CREATE TYPE public.common_targets AS ENUM (
    'ENTITY',
    'MATERIAL_ENTITY',
    'MATERIAL_GROUP',
    'ORGANISM',
    'DIGITAL_ENTITY',
    'GENETIC_SEQUENCE',
    'EVENT',
    'OCCURRENCE',
    'LOCATION',
    'GEOREFERENCE',
    'GEOLOGICAL_CONTEXT',
    'PROTOCOL',
    'AGENT',
    'COLLECTION',
    'ENTITY_RELATIONSHIP',
    'IDENTIFICATION',
    'TAXON',
    'REFERENCE',
    'AGENT_GROUP',
    'ASSERTION',
    'CHRONOMETRIC_AGE'
);
 !   DROP TYPE public.common_targets;
       public          postgres    false            �           1247    67988    degree_of_establishment    TYPE     >  CREATE TYPE public.degree_of_establishment AS ENUM (
    'MANAGED',
    'CAPTIVE',
    'CULTIVATED',
    'RELEASED',
    'UNESTABLISHED',
    'FAILING',
    'CASUAL',
    'NATURALIZED',
    'REPRODUCING',
    'ESTABLISHED',
    'SPREADING',
    'WIDESPREAD_INVASIVE',
    'COLONISING',
    'INVASIVE',
    'NATIVE'
);
 *   DROP TYPE public.degree_of_establishment;
       public          postgres    false            f           1247    67750    digital_entity_type    TYPE     �   CREATE TYPE public.digital_entity_type AS ENUM (
    'DATASET',
    'INTERACTIVE_RESOURCE',
    'MOVING_IMAGE',
    'SERVICE',
    'SOFTWARE',
    'SOUND',
    'STILL_IMAGE',
    'TEXT',
    'GENETIC_SEQUENCE'
);
 &   DROP TYPE public.digital_entity_type;
       public          postgres    false            `           1247    67737    entity_type    TYPE     X   CREATE TYPE public.entity_type AS ENUM (
    'DIGITAL_ENTITY',
    'MATERIAL_ENTITY'
);
    DROP TYPE public.entity_type;
       public          postgres    false            �           1247    67866    establishment_means    TYPE     �   CREATE TYPE public.establishment_means AS ENUM (
    'NATIVE_INDIGENOUS',
    'NATIVE_REINTRODUCED',
    'INTRODUCED',
    'INTRODUCED_ASSISTED_RECOLONISATION',
    'VAGRANT',
    'UNCERTAIN'
);
 &   DROP TYPE public.establishment_means;
       public          postgres    false            ~           1247    67861    occurrence_status    TYPE     N   CREATE TYPE public.occurrence_status AS ENUM (
    'PRESENT',
    'ABSENT'
);
 $   DROP TYPE public.occurrence_status;
       public          postgres    false            �           1247    67880    pathway    TYPE     -  CREATE TYPE public.pathway AS ENUM (
    'CORRIDOR_AND_DISPERSAL',
    'UNAIDED',
    'NATURAL_DISPERSAL',
    'CORRIDOR',
    'TUNNELS_BRIDGES',
    'WATERWAYS_BASINS_SEAS',
    'UNINTENTIONAL',
    'TRANSPORT_STOWAWAY',
    'OTHER_TRANSPORT',
    'VEHICLES',
    'HULL_FOULING',
    'BALLAST_WATER',
    'PACKING_MATERIAL',
    'PEOPLE',
    'MACHINERY_EQUIPMENT',
    'HITCHHIKERS_SHIP',
    'HITCHHIKERS_AIRPLANE',
    'CONTAINER_BULK',
    'FISHING_EQUIPMENT',
    'TRANSPORT_CONTAMINANT',
    'TRANSPORTATION_HABITAT_MATERIAL',
    'TIMBER_TRADE',
    'SEED_CONTAMINANT',
    'PARASITES_ON_PLANTS',
    'CONTAMINANT_ON_PLANTS',
    'PARASITES_ON_ANIMALS',
    'CONTAMINANT_ON_ANIMALS',
    'FOOD_CONTAMINANT',
    'CONTAMINATE_BAIT',
    'CONTAMINANT_NURSERY',
    'INTENTIONAL',
    'ESCAPE_FROM_CONFINEMENT',
    'OTHER_ESCAPE',
    'LIVE_FOOD_LIVE_BAIT',
    'RESEARCH',
    'ORNAMENTAL_NON_HORTICULTURE',
    'HORTICULTURE',
    'FUR',
    'FORESTRY',
    'FARMED_ANIMALS',
    'PET',
    'PUBLIC_GARDEN_ZOO_AQUARIA',
    'AQUACULTURE_MARICULTURE',
    'AGRICULTURE',
    'RELEASE_IN_NATURE',
    'OTHER_INTENTIONAL_RELEASE',
    'RELEASED_FOR_USE',
    'CONSERVATION_OR_WILDLIFE_MANAGEMENT',
    'LANDSCAPE_IMPROVEMENT',
    'HUNTING',
    'FISHERY_IN_THE_WILD',
    'EROSION_CONTROL',
    'BIOLOGICAL_CONTROL'
);
    DROP TYPE public.pathway;
       public          postgres    false            �            1259    68141    agent    TABLE     w   CREATE TABLE public.agent (
    agent_id text NOT NULL,
    agent_type text NOT NULL,
    preferred_agent_name text
);
    DROP TABLE public.agent;
       public         heap    postgres    false            �            1259    68148    agent_group    TABLE     a   CREATE TABLE public.agent_group (
    agent_group_id text NOT NULL,
    agent_group_type text
);
    DROP TABLE public.agent_group;
       public         heap    postgres    false            �            1259    68172    agent_relationship    TABLE     �   CREATE TABLE public.agent_relationship (
    subject_agent_id text NOT NULL,
    relationship_to text NOT NULL,
    object_agent_id text NOT NULL
);
 &   DROP TABLE public.agent_relationship;
       public         heap    postgres    false            �            1259    68233 
   agent_role    TABLE     �  CREATE TABLE public.agent_role (
    agent_role_target_id text NOT NULL,
    agent_role_target_type public.common_targets NOT NULL,
    agent_role_agent_id text NOT NULL,
    agent_role_agent_name text,
    agent_role_role text,
    agent_role_began text,
    agent_role_ended text,
    agent_role_order smallint DEFAULT 0 NOT NULL,
    CONSTRAINT agent_role_agent_role_order_check CHECK ((agent_role_order >= 0))
);
    DROP TABLE public.agent_role;
       public         heap    postgres    false    939            �            1259    68248 	   assertion    TABLE     !  CREATE TABLE public.assertion (
    assertion_id text NOT NULL,
    assertion_target_id text NOT NULL,
    assertion_target_type public.common_targets NOT NULL,
    assertion_parent_assertion_id text,
    assertion_type text NOT NULL,
    assertion_made_date text,
    assertion_effective_date text,
    assertion_value text,
    assertion_value_numeric numeric,
    assertion_unit text,
    assertion_by_agent_name text,
    assertion_by_agent_id text,
    assertion_protocol text,
    assertion_protocol_id text,
    assertion_remarks text
);
    DROP TABLE public.assertion;
       public         heap    postgres    false    939            �            1259    67847    chronometric_age    TABLE     "  CREATE TABLE public.chronometric_age (
    chronometric_age_id text NOT NULL,
    material_entity_id text,
    verbatim_chronometric_age text,
    verbatim_chronometric_age_protocol text,
    uncalibrated_chronometric_age text,
    chronometric_age_conversion_protocol text,
    earliest_chronometric_age integer,
    earliest_chronometric_age_reference_system text,
    latest_chronometric_age integer,
    latest_chronometric_age_reference_system text,
    chronometric_age_uncertainty_in_years integer,
    chronometric_age_uncertainty_method text,
    material_dated text,
    material_dated_id text,
    material_dated_relationship text,
    chronometric_age_determined_by text,
    chronometric_age_determined_date text,
    chronometric_age_references text,
    chronometric_age_remarks text
);
 $   DROP TABLE public.chronometric_age;
       public         heap    postgres    false            �            1259    68280    citation    TABLE     �   CREATE TABLE public.citation (
    citation_target_id text NOT NULL,
    citation_target_type public.common_targets NOT NULL,
    citation_reference_id text NOT NULL,
    citation_type text,
    citation_page_number text,
    citation_remarks text
);
    DROP TABLE public.citation;
       public         heap    postgres    false    939            �            1259    68160 
   collection    TABLE     �   CREATE TABLE public.collection (
    collection_id text NOT NULL,
    collection_type text,
    collection_code text,
    institution_code text,
    grscicoll_id uuid NOT NULL
);
    DROP TABLE public.collection;
       public         heap    postgres    false            �            1259    67769    digital_entity    TABLE     �  CREATE TABLE public.digital_entity (
    digital_entity_id text NOT NULL,
    digital_entity_type public.digital_entity_type NOT NULL,
    access_uri text NOT NULL,
    web_statement text,
    format text,
    license text,
    rights text,
    rights_uri text,
    access_rights text,
    rights_holder text,
    source text,
    source_uri text,
    creator text,
    created timestamp with time zone,
    modified timestamp with time zone,
    language text,
    bibliographic_citation text
);
 "   DROP TABLE public.digital_entity;
       public         heap    postgres    false    870            �            1259    67741    entity    TABLE     �   CREATE TABLE public.entity (
    entity_id text NOT NULL,
    entity_type public.entity_type NOT NULL,
    dataset_id text NOT NULL,
    entity_name text,
    entity_remarks text
);
    DROP TABLE public.entity;
       public         heap    postgres    false    864            �            1259    68056    entity_relationship    TABLE     �  CREATE TABLE public.entity_relationship (
    entity_relationship_id text NOT NULL,
    depends_on_entity_relationship_id text,
    subject_entity_id text,
    entity_relationship_type text NOT NULL,
    object_entity_id text,
    object_entity_iri text,
    entity_relationship_date text,
    entity_relationship_order smallint DEFAULT 0 NOT NULL,
    CONSTRAINT entity_relationship_entity_relationship_order_check CHECK ((entity_relationship_order >= 0))
);
 '   DROP TABLE public.entity_relationship;
       public         heap    postgres    false            �            1259    67709    event    TABLE     w  CREATE TABLE public.event (
    event_id text NOT NULL,
    parent_event_id text,
    dataset_id text NOT NULL,
    location_id text,
    protocol_id text,
    event_type text NOT NULL,
    event_name text,
    field_number text,
    event_date text,
    year smallint,
    month smallint,
    day smallint,
    verbatim_event_date text,
    verbatim_locality text,
    verbatim_elevation text,
    verbatim_depth text,
    verbatim_coordinates text,
    verbatim_latitude text,
    verbatim_longitude text,
    verbatim_coordinate_system text,
    verbatim_srs text,
    habitat text,
    protocol_description text,
    sample_size_value text,
    sample_size_unit text,
    event_effort text,
    field_notes text,
    event_remarks text,
    CONSTRAINT event_day_check CHECK (((day >= 1) AND (day <= 31))),
    CONSTRAINT event_month_check CHECK (((month >= 1) AND (month <= 12)))
);
    DROP TABLE public.event;
       public         heap    postgres    false            �            1259    67782    genetic_sequence    TABLE     �   CREATE TABLE public.genetic_sequence (
    genetic_sequence_id text NOT NULL,
    genetic_sequence_type text NOT NULL,
    sequence text NOT NULL
);
 $   DROP TABLE public.genetic_sequence;
       public         heap    postgres    false            �            1259    67643    geological_context    TABLE     �  CREATE TABLE public.geological_context (
    geological_context_id text NOT NULL,
    location_id text,
    earliest_eon_or_lowest_eonothem text,
    latest_eon_or_highest_eonothem text,
    earliest_era_or_lowest_erathem text,
    latest_era_or_highest_erathem text,
    earliest_period_or_lowest_system text,
    latest_period_or_highest_system text,
    earliest_epoch_or_lowest_series text,
    latest_epoch_or_highest_series text,
    earliest_age_or_lowest_stage text,
    latest_age_or_highest_stage text,
    lowest_biostratigraphic_zone text,
    highest_biostratigraphic_zone text,
    lithostratigraphic_terms text,
    "group" text,
    formation text,
    member text,
    bed text
);
 &   DROP TABLE public.geological_context;
       public         heap    postgres    false            �            1259    67651    georeference    TABLE     �  CREATE TABLE public.georeference (
    georeference_id text NOT NULL,
    location_id text,
    decimal_latitude numeric NOT NULL,
    decimal_longitude numeric NOT NULL,
    geodetic_datum text NOT NULL,
    coordinate_uncertainty_in_meters numeric,
    coordinate_precision numeric,
    point_radius_spatial_fit numeric,
    footprint_wkt text,
    footprint_srs text,
    footprint_spatial_fit numeric,
    georeferenced_by text,
    georeferenced_date text,
    georeference_protocol text,
    georeference_sources text,
    georeference_remarks text,
    preferred_spatial_representation text,
    CONSTRAINT georeference_coordinate_precision_check CHECK (((coordinate_precision >= (0)::numeric) AND (coordinate_precision <= (90)::numeric))),
    CONSTRAINT georeference_coordinate_uncertainty_in_meters_check CHECK (((coordinate_uncertainty_in_meters > (0)::numeric) AND (coordinate_uncertainty_in_meters <= (20037509)::numeric))),
    CONSTRAINT georeference_decimal_latitude_check CHECK (((decimal_latitude >= ('-90'::integer)::numeric) AND (decimal_latitude <= (90)::numeric))),
    CONSTRAINT georeference_decimal_longitude_check CHECK (((decimal_longitude >= ('-180'::integer)::numeric) AND (decimal_longitude <= (180)::numeric))),
    CONSTRAINT georeference_footprint_spatial_fit_check CHECK ((footprint_spatial_fit >= (0)::numeric)),
    CONSTRAINT georeference_point_radius_spatial_fit_check CHECK (((point_radius_spatial_fit = (0)::numeric) OR (point_radius_spatial_fit >= (1)::numeric)))
);
     DROP TABLE public.georeference;
       public         heap    postgres    false            �            1259    67818    identification    TABLE     �  CREATE TABLE public.identification (
    identification_id text NOT NULL,
    organism_id text,
    identification_type text NOT NULL,
    taxon_formula text NOT NULL,
    verbatim_identification text,
    type_status text,
    identified_by text,
    identified_by_id text,
    date_identified text,
    identification_references text,
    identification_verification_status text,
    identification_remarks text,
    type_designation_type text,
    type_designated_by text
);
 "   DROP TABLE public.identification;
       public         heap    postgres    false            �            1259    68091    identification_evidence    TABLE     r   CREATE TABLE public.identification_evidence (
    identification_id text NOT NULL,
    entity_id text NOT NULL
);
 +   DROP TABLE public.identification_evidence;
       public         heap    postgres    false            �            1259    68272 
   identifier    TABLE     �   CREATE TABLE public.identifier (
    identifier_target_id text NOT NULL,
    identifier_target_type public.common_targets NOT NULL,
    identifier_type text NOT NULL,
    identifier_value text NOT NULL
);
    DROP TABLE public.identifier;
       public         heap    postgres    false    939            �            1259    67665    location    TABLE     �  CREATE TABLE public.location (
    location_id text NOT NULL,
    parent_location_id text,
    higher_geography_id text,
    higher_geography text,
    continent text,
    water_body text,
    island_group text,
    island text,
    country text,
    country_code character(2),
    state_province text,
    county text,
    municipality text,
    locality text,
    minimum_elevation_in_meters numeric,
    maximum_elevation_in_meters numeric,
    minimum_distance_above_surface_in_meters numeric,
    maximum_distance_above_surface_in_meters numeric,
    minimum_depth_in_meters numeric,
    maximum_depth_in_meters numeric,
    vertical_datum text,
    location_according_to text,
    location_remarks text,
    accepted_georeference_id text,
    accepted_geological_context_id text,
    CONSTRAINT location_maximum_depth_in_meters_check CHECK (((maximum_depth_in_meters >= (0)::numeric) AND (maximum_depth_in_meters <= (11000)::numeric))),
    CONSTRAINT location_maximum_elevation_in_meters_check CHECK (((maximum_elevation_in_meters >= ('-430'::integer)::numeric) AND (maximum_elevation_in_meters <= (8850)::numeric))),
    CONSTRAINT location_minimum_depth_in_meters_check CHECK (((minimum_depth_in_meters >= (0)::numeric) AND (minimum_depth_in_meters <= (11000)::numeric))),
    CONSTRAINT location_minimum_elevation_in_meters_check CHECK (((minimum_elevation_in_meters >= ('-430'::integer)::numeric) AND (minimum_elevation_in_meters <= (8850)::numeric)))
);
    DROP TABLE public.location;
       public         heap    postgres    false            �            1259    67794    material_entity    TABLE     �  CREATE TABLE public.material_entity (
    material_entity_id text NOT NULL,
    material_entity_type text NOT NULL,
    preparations text,
    disposition text,
    institution_code text,
    institution_id text,
    collection_code text,
    collection_id text,
    owner_institution_code text,
    catalog_number text,
    record_number text,
    recorded_by text,
    recorded_by_id text,
    associated_references text,
    associated_sequences text,
    other_catalog_numbers text
);
 #   DROP TABLE public.material_entity;
       public         heap    postgres    false            �            1259    67806    material_group    TABLE     j   CREATE TABLE public.material_group (
    material_group_id text NOT NULL,
    material_group_type text
);
 "   DROP TABLE public.material_group;
       public         heap    postgres    false            �            1259    68019 
   occurrence    TABLE     �  CREATE TABLE public.occurrence (
    occurrence_id text NOT NULL,
    organism_id text,
    organism_quantity text,
    organism_quantity_type text,
    sex text,
    life_stage text,
    reproductive_condition text,
    behavior text,
    establishment_means public.establishment_means,
    occurrence_status public.occurrence_status DEFAULT 'PRESENT'::public.occurrence_status NOT NULL,
    pathway public.pathway,
    degree_of_establishment public.degree_of_establishment,
    georeference_verification_status text,
    occurrence_remarks text,
    information_withheld text,
    data_generalizations text,
    recorded_by text,
    recorded_by_id text,
    associated_media text,
    associated_occurrences text,
    associated_taxa text
);
    DROP TABLE public.occurrence;
       public         heap    postgres    false    894    894    900    897    903            �            1259    68039    occurrence_evidence    TABLE     j   CREATE TABLE public.occurrence_evidence (
    occurrence_id text NOT NULL,
    entity_id text NOT NULL
);
 '   DROP TABLE public.occurrence_evidence;
       public         heap    postgres    false            �            1259    67825    organism    TABLE     ~   CREATE TABLE public.organism (
    organism_id text NOT NULL,
    organism_scope text,
    accepted_identification_id text
);
    DROP TABLE public.organism;
       public         heap    postgres    false            �            1259    67702    protocol    TABLE     a   CREATE TABLE public.protocol (
    protocol_id text NOT NULL,
    protocol_type text NOT NULL
);
    DROP TABLE public.protocol;
       public         heap    postgres    false            �            1259    68083 	   reference    TABLE     G  CREATE TABLE public.reference (
    reference_id text NOT NULL,
    reference_type text NOT NULL,
    bibliographic_citation text,
    reference_year smallint,
    reference_iri text,
    is_peer_reviewed boolean,
    CONSTRAINT reference_reference_year_check CHECK (((reference_year >= 1600) AND (reference_year <= 2022)))
);
    DROP TABLE public.reference;
       public         heap    postgres    false            �            1259    68108    taxon    TABLE       CREATE TABLE public.taxon (
    taxon_id text NOT NULL,
    scientific_name text NOT NULL,
    scientific_name_authorship text,
    name_according_to text,
    name_according_to_id text,
    taxon_rank text,
    taxon_source text,
    scientific_name_id text,
    taxon_remarks text,
    parent_taxon_id text,
    taxonomic_status text,
    kingdom text,
    phylum text,
    class text,
    "order" text,
    family text,
    subfamily text,
    genus text,
    subgenus text,
    accepted_scientific_name text
);
    DROP TABLE public.taxon;
       public         heap    postgres    false            �            1259    68121    taxon_identification    TABLE     �  CREATE TABLE public.taxon_identification (
    taxon_id text NOT NULL,
    identification_id text NOT NULL,
    taxon_order smallint DEFAULT 0 NOT NULL,
    taxon_authority text,
    taxon_confidence_percent numeric NOT NULL,
    CONSTRAINT taxon_identification_taxon_confidence_percent_check CHECK (((taxon_confidence_percent >= (0)::numeric) AND (taxon_confidence_percent <= (100)::numeric))),
    CONSTRAINT taxon_identification_taxon_order_check CHECK ((taxon_order >= 0))
);
 (   DROP TABLE public.taxon_identification;
       public         heap    postgres    false                      0    68141    agent 
   TABLE DATA           K   COPY public.agent (agent_id, agent_type, preferred_agent_name) FROM stdin;
    public          postgres    false    229                   0    68148    agent_group 
   TABLE DATA           G   COPY public.agent_group (agent_group_id, agent_group_type) FROM stdin;
    public          postgres    false    230   {                0    68172    agent_relationship 
   TABLE DATA           `   COPY public.agent_relationship (subject_agent_id, relationship_to, object_agent_id) FROM stdin;
    public          postgres    false    232   �                0    68233 
   agent_role 
   TABLE DATA           �   COPY public.agent_role (agent_role_target_id, agent_role_target_type, agent_role_agent_id, agent_role_agent_name, agent_role_role, agent_role_began, agent_role_ended, agent_role_order) FROM stdin;
    public          postgres    false    233   �                0    68248 	   assertion 
   TABLE DATA           c  COPY public.assertion (assertion_id, assertion_target_id, assertion_target_type, assertion_parent_assertion_id, assertion_type, assertion_made_date, assertion_effective_date, assertion_value, assertion_value_numeric, assertion_unit, assertion_by_agent_name, assertion_by_agent_id, assertion_protocol, assertion_protocol_id, assertion_remarks) FROM stdin;
    public          postgres    false    234         �          0    67847    chronometric_age 
   TABLE DATA           f  COPY public.chronometric_age (chronometric_age_id, material_entity_id, verbatim_chronometric_age, verbatim_chronometric_age_protocol, uncalibrated_chronometric_age, chronometric_age_conversion_protocol, earliest_chronometric_age, earliest_chronometric_age_reference_system, latest_chronometric_age, latest_chronometric_age_reference_system, chronometric_age_uncertainty_in_years, chronometric_age_uncertainty_method, material_dated, material_dated_id, material_dated_relationship, chronometric_age_determined_by, chronometric_age_determined_date, chronometric_age_references, chronometric_age_remarks) FROM stdin;
    public          postgres    false    221   -      	          0    68280    citation 
   TABLE DATA           �   COPY public.citation (citation_target_id, citation_target_type, citation_reference_id, citation_type, citation_page_number, citation_remarks) FROM stdin;
    public          postgres    false    236   J                0    68160 
   collection 
   TABLE DATA           u   COPY public.collection (collection_id, collection_type, collection_code, institution_code, grscicoll_id) FROM stdin;
    public          postgres    false    231   g      �          0    67769    digital_entity 
   TABLE DATA              COPY public.digital_entity (digital_entity_id, digital_entity_type, access_uri, web_statement, format, license, rights, rights_uri, access_rights, rights_holder, source, source_uri, creator, created, modified, language, bibliographic_citation) FROM stdin;
    public          postgres    false    215   �      �          0    67741    entity 
   TABLE DATA           a   COPY public.entity (entity_id, entity_type, dataset_id, entity_name, entity_remarks) FROM stdin;
    public          postgres    false    214   �      �          0    68056    entity_relationship 
   TABLE DATA           �   COPY public.entity_relationship (entity_relationship_id, depends_on_entity_relationship_id, subject_entity_id, entity_relationship_type, object_entity_id, object_entity_iri, entity_relationship_date, entity_relationship_order) FROM stdin;
    public          postgres    false    224   �'      �          0    67709    event 
   TABLE DATA           �  COPY public.event (event_id, parent_event_id, dataset_id, location_id, protocol_id, event_type, event_name, field_number, event_date, year, month, day, verbatim_event_date, verbatim_locality, verbatim_elevation, verbatim_depth, verbatim_coordinates, verbatim_latitude, verbatim_longitude, verbatim_coordinate_system, verbatim_srs, habitat, protocol_description, sample_size_value, sample_size_unit, event_effort, field_notes, event_remarks) FROM stdin;
    public          postgres    false    213   5<      �          0    67782    genetic_sequence 
   TABLE DATA           `   COPY public.genetic_sequence (genetic_sequence_id, genetic_sequence_type, sequence) FROM stdin;
    public          postgres    false    216   CZ      �          0    67643    geological_context 
   TABLE DATA             COPY public.geological_context (geological_context_id, location_id, earliest_eon_or_lowest_eonothem, latest_eon_or_highest_eonothem, earliest_era_or_lowest_erathem, latest_era_or_highest_erathem, earliest_period_or_lowest_system, latest_period_or_highest_system, earliest_epoch_or_lowest_series, latest_epoch_or_highest_series, earliest_age_or_lowest_stage, latest_age_or_highest_stage, lowest_biostratigraphic_zone, highest_biostratigraphic_zone, lithostratigraphic_terms, "group", formation, member, bed) FROM stdin;
    public          postgres    false    209   `Z      �          0    67651    georeference 
   TABLE DATA           �  COPY public.georeference (georeference_id, location_id, decimal_latitude, decimal_longitude, geodetic_datum, coordinate_uncertainty_in_meters, coordinate_precision, point_radius_spatial_fit, footprint_wkt, footprint_srs, footprint_spatial_fit, georeferenced_by, georeferenced_date, georeference_protocol, georeference_sources, georeference_remarks, preferred_spatial_representation) FROM stdin;
    public          postgres    false    210   }Z      �          0    67818    identification 
   TABLE DATA           F  COPY public.identification (identification_id, organism_id, identification_type, taxon_formula, verbatim_identification, type_status, identified_by, identified_by_id, date_identified, identification_references, identification_verification_status, identification_remarks, type_designation_type, type_designated_by) FROM stdin;
    public          postgres    false    219   n      �          0    68091    identification_evidence 
   TABLE DATA           O   COPY public.identification_evidence (identification_id, entity_id) FROM stdin;
    public          postgres    false    226   ��                0    68272 
   identifier 
   TABLE DATA           u   COPY public.identifier (identifier_target_id, identifier_target_type, identifier_type, identifier_value) FROM stdin;
    public          postgres    false    235   ԃ      �          0    67665    location 
   TABLE DATA             COPY public.location (location_id, parent_location_id, higher_geography_id, higher_geography, continent, water_body, island_group, island, country, country_code, state_province, county, municipality, locality, minimum_elevation_in_meters, maximum_elevation_in_meters, minimum_distance_above_surface_in_meters, maximum_distance_above_surface_in_meters, minimum_depth_in_meters, maximum_depth_in_meters, vertical_datum, location_according_to, location_remarks, accepted_georeference_id, accepted_geological_context_id) FROM stdin;
    public          postgres    false    211   �      �          0    67794    material_entity 
   TABLE DATA           H  COPY public.material_entity (material_entity_id, material_entity_type, preparations, disposition, institution_code, institution_id, collection_code, collection_id, owner_institution_code, catalog_number, record_number, recorded_by, recorded_by_id, associated_references, associated_sequences, other_catalog_numbers) FROM stdin;
    public          postgres    false    217   ƛ      �          0    67806    material_group 
   TABLE DATA           P   COPY public.material_group (material_group_id, material_group_type) FROM stdin;
    public          postgres    false    218   ��      �          0    68019 
   occurrence 
   TABLE DATA           �  COPY public.occurrence (occurrence_id, organism_id, organism_quantity, organism_quantity_type, sex, life_stage, reproductive_condition, behavior, establishment_means, occurrence_status, pathway, degree_of_establishment, georeference_verification_status, occurrence_remarks, information_withheld, data_generalizations, recorded_by, recorded_by_id, associated_media, associated_occurrences, associated_taxa) FROM stdin;
    public          postgres    false    222   ͣ      �          0    68039    occurrence_evidence 
   TABLE DATA           G   COPY public.occurrence_evidence (occurrence_id, entity_id) FROM stdin;
    public          postgres    false    223   �      �          0    67825    organism 
   TABLE DATA           [   COPY public.organism (organism_id, organism_scope, accepted_identification_id) FROM stdin;
    public          postgres    false    220   �      �          0    67702    protocol 
   TABLE DATA           >   COPY public.protocol (protocol_id, protocol_type) FROM stdin;
    public          postgres    false    212   E�      �          0    68083 	   reference 
   TABLE DATA           �   COPY public.reference (reference_id, reference_type, bibliographic_citation, reference_year, reference_iri, is_peer_reviewed) FROM stdin;
    public          postgres    false    225   b�                 0    68108    taxon 
   TABLE DATA           >  COPY public.taxon (taxon_id, scientific_name, scientific_name_authorship, name_according_to, name_according_to_id, taxon_rank, taxon_source, scientific_name_id, taxon_remarks, parent_taxon_id, taxonomic_status, kingdom, phylum, class, "order", family, subfamily, genus, subgenus, accepted_scientific_name) FROM stdin;
    public          postgres    false    227   J�                0    68121    taxon_identification 
   TABLE DATA           �   COPY public.taxon_identification (taxon_id, identification_id, taxon_order, taxon_authority, taxon_confidence_percent) FROM stdin;
    public          postgres    false    228   �      +           2606    68154    agent_group agent_group_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.agent_group
    ADD CONSTRAINT agent_group_pkey PRIMARY KEY (agent_group_id);
 F   ALTER TABLE ONLY public.agent_group DROP CONSTRAINT agent_group_pkey;
       public            postgres    false    230            )           2606    68147    agent agent_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.agent
    ADD CONSTRAINT agent_pkey PRIMARY KEY (agent_id);
 :   ALTER TABLE ONLY public.agent DROP CONSTRAINT agent_pkey;
       public            postgres    false    229            /           2606    68178 *   agent_relationship agent_relationship_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.agent_relationship
    ADD CONSTRAINT agent_relationship_pkey PRIMARY KEY (subject_agent_id, relationship_to, object_agent_id);
 T   ALTER TABLE ONLY public.agent_relationship DROP CONSTRAINT agent_relationship_pkey;
       public            postgres    false    232    232    232            2           2606    68241    agent_role agent_role_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.agent_role
    ADD CONSTRAINT agent_role_pkey PRIMARY KEY (agent_role_target_id, agent_role_target_type, agent_role_agent_id, agent_role_order);
 D   ALTER TABLE ONLY public.agent_role DROP CONSTRAINT agent_role_pkey;
       public            postgres    false    233    233    233    233            6           2606    68254    assertion assertion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.assertion
    ADD CONSTRAINT assertion_pkey PRIMARY KEY (assertion_id);
 B   ALTER TABLE ONLY public.assertion DROP CONSTRAINT assertion_pkey;
       public            postgres    false    234                       2606    67853 &   chronometric_age chronometric_age_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.chronometric_age
    ADD CONSTRAINT chronometric_age_pkey PRIMARY KEY (chronometric_age_id);
 P   ALTER TABLE ONLY public.chronometric_age DROP CONSTRAINT chronometric_age_pkey;
       public            postgres    false    221            =           2606    68286    citation citation_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.citation
    ADD CONSTRAINT citation_pkey PRIMARY KEY (citation_target_id, citation_target_type, citation_reference_id);
 @   ALTER TABLE ONLY public.citation DROP CONSTRAINT citation_pkey;
       public            postgres    false    236    236    236            -           2606    68166    collection collection_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (collection_id);
 D   ALTER TABLE ONLY public.collection DROP CONSTRAINT collection_pkey;
       public            postgres    false    231                       2606    67775 "   digital_entity digital_entity_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.digital_entity
    ADD CONSTRAINT digital_entity_pkey PRIMARY KEY (digital_entity_id);
 L   ALTER TABLE ONLY public.digital_entity DROP CONSTRAINT digital_entity_pkey;
       public            postgres    false    215                       2606    67747    entity entity_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.entity
    ADD CONSTRAINT entity_pkey PRIMARY KEY (entity_id);
 <   ALTER TABLE ONLY public.entity DROP CONSTRAINT entity_pkey;
       public            postgres    false    214                       2606    68064 ,   entity_relationship entity_relationship_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.entity_relationship
    ADD CONSTRAINT entity_relationship_pkey PRIMARY KEY (entity_relationship_id);
 V   ALTER TABLE ONLY public.entity_relationship DROP CONSTRAINT entity_relationship_pkey;
       public            postgres    false    224            �           2606    67717    event event_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (event_id);
 :   ALTER TABLE ONLY public.event DROP CONSTRAINT event_pkey;
       public            postgres    false    213                       2606    67788 &   genetic_sequence genetic_sequence_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.genetic_sequence
    ADD CONSTRAINT genetic_sequence_pkey PRIMARY KEY (genetic_sequence_id);
 P   ALTER TABLE ONLY public.genetic_sequence DROP CONSTRAINT genetic_sequence_pkey;
       public            postgres    false    216            �           2606    67649 *   geological_context geological_context_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.geological_context
    ADD CONSTRAINT geological_context_pkey PRIMARY KEY (geological_context_id);
 T   ALTER TABLE ONLY public.geological_context DROP CONSTRAINT geological_context_pkey;
       public            postgres    false    209            �           2606    67663    georeference georeference_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.georeference
    ADD CONSTRAINT georeference_pkey PRIMARY KEY (georeference_id);
 H   ALTER TABLE ONLY public.georeference DROP CONSTRAINT georeference_pkey;
       public            postgres    false    210            "           2606    68097 4   identification_evidence identification_evidence_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.identification_evidence
    ADD CONSTRAINT identification_evidence_pkey PRIMARY KEY (identification_id, entity_id);
 ^   ALTER TABLE ONLY public.identification_evidence DROP CONSTRAINT identification_evidence_pkey;
       public            postgres    false    226    226                       2606    67824 "   identification identification_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.identification
    ADD CONSTRAINT identification_pkey PRIMARY KEY (identification_id);
 L   ALTER TABLE ONLY public.identification DROP CONSTRAINT identification_pkey;
       public            postgres    false    219            9           2606    68278    identifier identifier_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.identifier
    ADD CONSTRAINT identifier_pkey PRIMARY KEY (identifier_target_id, identifier_target_type, identifier_type, identifier_value);
 D   ALTER TABLE ONLY public.identifier DROP CONSTRAINT identifier_pkey;
       public            postgres    false    235    235    235    235            �           2606    67675    location location_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);
 @   ALTER TABLE ONLY public.location DROP CONSTRAINT location_pkey;
       public            postgres    false    211            
           2606    67800 $   material_entity material_entity_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.material_entity
    ADD CONSTRAINT material_entity_pkey PRIMARY KEY (material_entity_id);
 N   ALTER TABLE ONLY public.material_entity DROP CONSTRAINT material_entity_pkey;
       public            postgres    false    217                       2606    67812 "   material_group material_group_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.material_group
    ADD CONSTRAINT material_group_pkey PRIMARY KEY (material_group_id);
 L   ALTER TABLE ONLY public.material_group DROP CONSTRAINT material_group_pkey;
       public            postgres    false    218                       2606    68045 ,   occurrence_evidence occurrence_evidence_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.occurrence_evidence
    ADD CONSTRAINT occurrence_evidence_pkey PRIMARY KEY (occurrence_id, entity_id);
 V   ALTER TABLE ONLY public.occurrence_evidence DROP CONSTRAINT occurrence_evidence_pkey;
       public            postgres    false    223    223                       2606    68026    occurrence occurrence_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.occurrence
    ADD CONSTRAINT occurrence_pkey PRIMARY KEY (occurrence_id);
 D   ALTER TABLE ONLY public.occurrence DROP CONSTRAINT occurrence_pkey;
       public            postgres    false    222                       2606    67831    organism organism_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.organism
    ADD CONSTRAINT organism_pkey PRIMARY KEY (organism_id);
 @   ALTER TABLE ONLY public.organism DROP CONSTRAINT organism_pkey;
       public            postgres    false    220            �           2606    67708    protocol protocol_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.protocol
    ADD CONSTRAINT protocol_pkey PRIMARY KEY (protocol_id);
 @   ALTER TABLE ONLY public.protocol DROP CONSTRAINT protocol_pkey;
       public            postgres    false    212                        2606    68090    reference reference_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.reference
    ADD CONSTRAINT reference_pkey PRIMARY KEY (reference_id);
 B   ALTER TABLE ONLY public.reference DROP CONSTRAINT reference_pkey;
       public            postgres    false    225            '           2606    68130 .   taxon_identification taxon_identification_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.taxon_identification
    ADD CONSTRAINT taxon_identification_pkey PRIMARY KEY (taxon_id, identification_id, taxon_order);
 X   ALTER TABLE ONLY public.taxon_identification DROP CONSTRAINT taxon_identification_pkey;
       public            postgres    false    228    228    228            %           2606    68114    taxon taxon_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.taxon
    ADD CONSTRAINT taxon_pkey PRIMARY KEY (taxon_id);
 :   ALTER TABLE ONLY public.taxon DROP CONSTRAINT taxon_pkey;
       public            postgres    false    227            0           1259    68247 %   agent_role_agent_role_target_type_idx    INDEX     n   CREATE INDEX agent_role_agent_role_target_type_idx ON public.agent_role USING btree (agent_role_target_type);
 9   DROP INDEX public.agent_role_agent_role_target_type_idx;
       public            postgres    false    233            3           1259    68270 7   assertion_assertion_target_type_assertion_target_id_idx    INDEX     �   CREATE INDEX assertion_assertion_target_type_assertion_target_id_idx ON public.assertion USING btree (assertion_target_type, assertion_target_id);
 K   DROP INDEX public.assertion_assertion_target_type_assertion_target_id_idx;
       public            postgres    false    234    234            4           1259    68271 #   assertion_assertion_target_type_idx    INDEX     j   CREATE INDEX assertion_assertion_target_type_idx ON public.assertion USING btree (assertion_target_type);
 7   DROP INDEX public.assertion_assertion_target_type_idx;
       public            postgres    false    234                       1259    67859 '   chronometric_age_material_entity_id_idx    INDEX     r   CREATE INDEX chronometric_age_material_entity_id_idx ON public.chronometric_age USING btree (material_entity_id);
 ;   DROP INDEX public.chronometric_age_material_entity_id_idx;
       public            postgres    false    221            :           1259    68292 5   citation_citation_target_id_citation_reference_id_idx    INDEX     �   CREATE INDEX citation_citation_target_id_citation_reference_id_idx ON public.citation USING btree (citation_target_id, citation_reference_id);
 I   DROP INDEX public.citation_citation_target_id_citation_reference_id_idx;
       public            postgres    false    236    236            ;           1259    68293 !   citation_citation_target_type_idx    INDEX     f   CREATE INDEX citation_citation_target_type_idx ON public.citation USING btree (citation_target_type);
 5   DROP INDEX public.citation_citation_target_type_idx;
       public            postgres    false    236                       1259    67781 &   digital_entity_digital_entity_type_idx    INDEX     p   CREATE INDEX digital_entity_digital_entity_type_idx ON public.digital_entity USING btree (digital_entity_type);
 :   DROP INDEX public.digital_entity_digital_entity_type_idx;
       public            postgres    false    215                       1259    67748    entity_entity_type_idx    INDEX     P   CREATE INDEX entity_entity_type_idx ON public.entity USING btree (entity_type);
 *   DROP INDEX public.entity_entity_type_idx;
       public            postgres    false    214                       1259    68080 9   entity_relationship_depends_on_entity_relationship_id_idx    INDEX     �   CREATE INDEX entity_relationship_depends_on_entity_relationship_id_idx ON public.entity_relationship USING btree (depends_on_entity_relationship_id);
 M   DROP INDEX public.entity_relationship_depends_on_entity_relationship_id_idx;
       public            postgres    false    224                       1259    68082 (   entity_relationship_object_entity_id_idx    INDEX     t   CREATE INDEX entity_relationship_object_entity_id_idx ON public.entity_relationship USING btree (object_entity_id);
 <   DROP INDEX public.entity_relationship_object_entity_id_idx;
       public            postgres    false    224                       1259    68081 )   entity_relationship_subject_entity_id_idx    INDEX     v   CREATE INDEX entity_relationship_subject_entity_id_idx ON public.entity_relationship USING btree (subject_entity_id);
 =   DROP INDEX public.entity_relationship_subject_entity_id_idx;
       public            postgres    false    224            �           1259    67734    event_location_id_idx    INDEX     N   CREATE INDEX event_location_id_idx ON public.event USING btree (location_id);
 )   DROP INDEX public.event_location_id_idx;
       public            postgres    false    213            �           1259    67733    event_parent_event_id_idx    INDEX     V   CREATE INDEX event_parent_event_id_idx ON public.event USING btree (parent_event_id);
 -   DROP INDEX public.event_parent_event_id_idx;
       public            postgres    false    213                        1259    67735    event_protocol_id_idx    INDEX     N   CREATE INDEX event_protocol_id_idx ON public.event USING btree (protocol_id);
 )   DROP INDEX public.event_protocol_id_idx;
       public            postgres    false    213            �           1259    67650 "   geological_context_location_id_idx    INDEX     h   CREATE INDEX geological_context_location_id_idx ON public.geological_context USING btree (location_id);
 6   DROP INDEX public.geological_context_location_id_idx;
       public            postgres    false    209            �           1259    67664    georeference_location_id_idx    INDEX     \   CREATE INDEX georeference_location_id_idx ON public.georeference USING btree (location_id);
 0   DROP INDEX public.georeference_location_id_idx;
       public            postgres    false    210            7           1259    68279 %   identifier_identifier_target_type_idx    INDEX     n   CREATE INDEX identifier_identifier_target_type_idx ON public.identifier USING btree (identifier_target_type);
 9   DROP INDEX public.identifier_identifier_target_type_idx;
       public            postgres    false    235            �           1259    67691    location_parent_location_id_idx    INDEX     b   CREATE INDEX location_parent_location_id_idx ON public.location USING btree (parent_location_id);
 3   DROP INDEX public.location_parent_location_id_idx;
       public            postgres    false    211                       1259    68038     occurrence_occurrence_status_idx    INDEX     d   CREATE INDEX occurrence_occurrence_status_idx ON public.occurrence USING btree (occurrence_status);
 4   DROP INDEX public.occurrence_occurrence_status_idx;
       public            postgres    false    222                       1259    68037    occurrence_organism_id_idx    INDEX     X   CREATE INDEX occurrence_organism_id_idx ON public.occurrence USING btree (organism_id);
 .   DROP INDEX public.occurrence_organism_id_idx;
       public            postgres    false    222            #           1259    68120    taxon_parent_taxon_id_idx    INDEX     V   CREATE INDEX taxon_parent_taxon_id_idx ON public.taxon USING btree (parent_taxon_id);
 -   DROP INDEX public.taxon_parent_taxon_id_idx;
       public            postgres    false    227            Z           2606    68155 +   agent_group agent_group_agent_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agent_group
    ADD CONSTRAINT agent_group_agent_group_id_fkey FOREIGN KEY (agent_group_id) REFERENCES public.agent(agent_id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.agent_group DROP CONSTRAINT agent_group_agent_group_id_fkey;
       public          postgres    false    3369    230    229            ]           2606    68184 :   agent_relationship agent_relationship_object_agent_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agent_relationship
    ADD CONSTRAINT agent_relationship_object_agent_id_fkey FOREIGN KEY (object_agent_id) REFERENCES public.agent(agent_id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.agent_relationship DROP CONSTRAINT agent_relationship_object_agent_id_fkey;
       public          postgres    false    232    3369    229            \           2606    68179 ;   agent_relationship agent_relationship_subject_agent_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agent_relationship
    ADD CONSTRAINT agent_relationship_subject_agent_id_fkey FOREIGN KEY (subject_agent_id) REFERENCES public.agent(agent_id) ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.agent_relationship DROP CONSTRAINT agent_relationship_subject_agent_id_fkey;
       public          postgres    false    232    3369    229            ^           2606    68242 .   agent_role agent_role_agent_role_agent_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.agent_role
    ADD CONSTRAINT agent_role_agent_role_agent_id_fkey FOREIGN KEY (agent_role_agent_id) REFERENCES public.agent(agent_id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.agent_role DROP CONSTRAINT agent_role_agent_role_agent_id_fkey;
       public          postgres    false    229    3369    233            `           2606    68260 .   assertion assertion_assertion_by_agent_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assertion
    ADD CONSTRAINT assertion_assertion_by_agent_id_fkey FOREIGN KEY (assertion_by_agent_id) REFERENCES public.agent(agent_id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.assertion DROP CONSTRAINT assertion_assertion_by_agent_id_fkey;
       public          postgres    false    229    3369    234            _           2606    68255 6   assertion assertion_assertion_parent_assertion_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assertion
    ADD CONSTRAINT assertion_assertion_parent_assertion_id_fkey FOREIGN KEY (assertion_parent_assertion_id) REFERENCES public.assertion(assertion_id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.assertion DROP CONSTRAINT assertion_assertion_parent_assertion_id_fkey;
       public          postgres    false    234    3382    234            a           2606    68265 .   assertion assertion_assertion_protocol_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.assertion
    ADD CONSTRAINT assertion_assertion_protocol_id_fkey FOREIGN KEY (assertion_protocol_id) REFERENCES public.protocol(protocol_id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.assertion DROP CONSTRAINT assertion_assertion_protocol_id_fkey;
       public          postgres    false    212    234    3323            M           2606    67854 9   chronometric_age chronometric_age_material_entity_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.chronometric_age
    ADD CONSTRAINT chronometric_age_material_entity_id_fkey FOREIGN KEY (material_entity_id) REFERENCES public.material_entity(material_entity_id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.chronometric_age DROP CONSTRAINT chronometric_age_material_entity_id_fkey;
       public          postgres    false    217    3338    221            b           2606    68287 ,   citation citation_citation_reference_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.citation
    ADD CONSTRAINT citation_citation_reference_id_fkey FOREIGN KEY (citation_reference_id) REFERENCES public.reference(reference_id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.citation DROP CONSTRAINT citation_citation_reference_id_fkey;
       public          postgres    false    225    236    3360            [           2606    68167 (   collection collection_collection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.agent(agent_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.collection DROP CONSTRAINT collection_collection_id_fkey;
       public          postgres    false    229    3369    231            F           2606    67776 4   digital_entity digital_entity_digital_entity_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.digital_entity
    ADD CONSTRAINT digital_entity_digital_entity_id_fkey FOREIGN KEY (digital_entity_id) REFERENCES public.entity(entity_id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.digital_entity DROP CONSTRAINT digital_entity_digital_entity_id_fkey;
       public          postgres    false    214    215    3331            R           2606    68065 N   entity_relationship entity_relationship_depends_on_entity_relationship_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entity_relationship
    ADD CONSTRAINT entity_relationship_depends_on_entity_relationship_id_fkey FOREIGN KEY (depends_on_entity_relationship_id) REFERENCES public.entity_relationship(entity_relationship_id) ON DELETE CASCADE;
 x   ALTER TABLE ONLY public.entity_relationship DROP CONSTRAINT entity_relationship_depends_on_entity_relationship_id_fkey;
       public          postgres    false    224    224    3357            T           2606    68075 =   entity_relationship entity_relationship_object_entity_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entity_relationship
    ADD CONSTRAINT entity_relationship_object_entity_id_fkey FOREIGN KEY (object_entity_id) REFERENCES public.entity(entity_id) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.entity_relationship DROP CONSTRAINT entity_relationship_object_entity_id_fkey;
       public          postgres    false    214    224    3331            S           2606    68070 >   entity_relationship entity_relationship_subject_entity_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entity_relationship
    ADD CONSTRAINT entity_relationship_subject_entity_id_fkey FOREIGN KEY (subject_entity_id) REFERENCES public.entity(entity_id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.entity_relationship DROP CONSTRAINT entity_relationship_subject_entity_id_fkey;
       public          postgres    false    3331    224    214            D           2606    67723    event event_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.event DROP CONSTRAINT event_location_id_fkey;
       public          postgres    false    3321    213    211            C           2606    67718     event event_parent_event_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_parent_event_id_fkey FOREIGN KEY (parent_event_id) REFERENCES public.event(event_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.event DROP CONSTRAINT event_parent_event_id_fkey;
       public          postgres    false    213    3327    213            E           2606    67728    event event_protocol_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_protocol_id_fkey FOREIGN KEY (protocol_id) REFERENCES public.protocol(protocol_id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.event DROP CONSTRAINT event_protocol_id_fkey;
       public          postgres    false    3323    213    212            G           2606    67789 :   genetic_sequence genetic_sequence_genetic_sequence_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genetic_sequence
    ADD CONSTRAINT genetic_sequence_genetic_sequence_id_fkey FOREIGN KEY (genetic_sequence_id) REFERENCES public.digital_entity(digital_entity_id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.genetic_sequence DROP CONSTRAINT genetic_sequence_genetic_sequence_id_fkey;
       public          postgres    false    216    215    3334            >           2606    67692 6   geological_context geological_context_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.geological_context
    ADD CONSTRAINT geological_context_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.geological_context DROP CONSTRAINT geological_context_location_id_fkey;
       public          postgres    false    211    3321    209            ?           2606    67697 *   georeference georeference_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.georeference
    ADD CONSTRAINT georeference_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.georeference DROP CONSTRAINT georeference_location_id_fkey;
       public          postgres    false    210    211    3321            V           2606    68103 >   identification_evidence identification_evidence_entity_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.identification_evidence
    ADD CONSTRAINT identification_evidence_entity_id_fkey FOREIGN KEY (entity_id) REFERENCES public.entity(entity_id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.identification_evidence DROP CONSTRAINT identification_evidence_entity_id_fkey;
       public          postgres    false    214    226    3331            U           2606    68098 F   identification_evidence identification_evidence_identification_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.identification_evidence
    ADD CONSTRAINT identification_evidence_identification_id_fkey FOREIGN KEY (identification_id) REFERENCES public.identification(identification_id) ON DELETE CASCADE;
 p   ALTER TABLE ONLY public.identification_evidence DROP CONSTRAINT identification_evidence_identification_id_fkey;
       public          postgres    false    219    226    3342            J           2606    67842 .   identification identification_organism_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.identification
    ADD CONSTRAINT identification_organism_id_fkey FOREIGN KEY (organism_id) REFERENCES public.organism(organism_id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.identification DROP CONSTRAINT identification_organism_id_fkey;
       public          postgres    false    220    219    3344            B           2606    67686 5   location location_accepted_geological_context_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_accepted_geological_context_id_fkey FOREIGN KEY (accepted_geological_context_id) REFERENCES public.geological_context(geological_context_id) ON DELETE SET NULL;
 _   ALTER TABLE ONLY public.location DROP CONSTRAINT location_accepted_geological_context_id_fkey;
       public          postgres    false    211    209    3315            A           2606    67681 /   location location_accepted_georeference_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_accepted_georeference_id_fkey FOREIGN KEY (accepted_georeference_id) REFERENCES public.georeference(georeference_id) ON DELETE SET NULL;
 Y   ALTER TABLE ONLY public.location DROP CONSTRAINT location_accepted_georeference_id_fkey;
       public          postgres    false    210    211    3318            @           2606    67676 )   location location_parent_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_parent_location_id_fkey FOREIGN KEY (parent_location_id) REFERENCES public.location(location_id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.location DROP CONSTRAINT location_parent_location_id_fkey;
       public          postgres    false    3321    211    211            H           2606    67801 7   material_entity material_entity_material_entity_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_entity
    ADD CONSTRAINT material_entity_material_entity_id_fkey FOREIGN KEY (material_entity_id) REFERENCES public.entity(entity_id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.material_entity DROP CONSTRAINT material_entity_material_entity_id_fkey;
       public          postgres    false    217    3331    214            I           2606    67813 4   material_group material_group_material_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material_group
    ADD CONSTRAINT material_group_material_group_id_fkey FOREIGN KEY (material_group_id) REFERENCES public.material_entity(material_entity_id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.material_group DROP CONSTRAINT material_group_material_group_id_fkey;
       public          postgres    false    217    3338    218            Q           2606    68051 6   occurrence_evidence occurrence_evidence_entity_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.occurrence_evidence
    ADD CONSTRAINT occurrence_evidence_entity_id_fkey FOREIGN KEY (entity_id) REFERENCES public.entity(entity_id) ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.occurrence_evidence DROP CONSTRAINT occurrence_evidence_entity_id_fkey;
       public          postgres    false    223    3331    214            P           2606    68046 :   occurrence_evidence occurrence_evidence_occurrence_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.occurrence_evidence
    ADD CONSTRAINT occurrence_evidence_occurrence_id_fkey FOREIGN KEY (occurrence_id) REFERENCES public.occurrence(occurrence_id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.occurrence_evidence DROP CONSTRAINT occurrence_evidence_occurrence_id_fkey;
       public          postgres    false    222    3351    223            N           2606    68027 (   occurrence occurrence_occurrence_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.occurrence
    ADD CONSTRAINT occurrence_occurrence_id_fkey FOREIGN KEY (occurrence_id) REFERENCES public.event(event_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.occurrence DROP CONSTRAINT occurrence_occurrence_id_fkey;
       public          postgres    false    222    213    3327            O           2606    68032 &   occurrence occurrence_organism_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.occurrence
    ADD CONSTRAINT occurrence_organism_id_fkey FOREIGN KEY (organism_id) REFERENCES public.organism(organism_id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.occurrence DROP CONSTRAINT occurrence_organism_id_fkey;
       public          postgres    false    222    220    3344            L           2606    67837 1   organism organism_accepted_identification_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.organism
    ADD CONSTRAINT organism_accepted_identification_id_fkey FOREIGN KEY (accepted_identification_id) REFERENCES public.identification(identification_id) ON DELETE SET NULL;
 [   ALTER TABLE ONLY public.organism DROP CONSTRAINT organism_accepted_identification_id_fkey;
       public          postgres    false    220    219    3342            K           2606    67832 "   organism organism_organism_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.organism
    ADD CONSTRAINT organism_organism_id_fkey FOREIGN KEY (organism_id) REFERENCES public.material_entity(material_entity_id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.organism DROP CONSTRAINT organism_organism_id_fkey;
       public          postgres    false    3338    220    217            Y           2606    68136 @   taxon_identification taxon_identification_identification_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxon_identification
    ADD CONSTRAINT taxon_identification_identification_id_fkey FOREIGN KEY (identification_id) REFERENCES public.identification(identification_id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.taxon_identification DROP CONSTRAINT taxon_identification_identification_id_fkey;
       public          postgres    false    3342    228    219            X           2606    68131 7   taxon_identification taxon_identification_taxon_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxon_identification
    ADD CONSTRAINT taxon_identification_taxon_id_fkey FOREIGN KEY (taxon_id) REFERENCES public.taxon(taxon_id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.taxon_identification DROP CONSTRAINT taxon_identification_taxon_id_fkey;
       public          postgres    false    3365    227    228            W           2606    68115     taxon taxon_parent_taxon_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxon
    ADD CONSTRAINT taxon_parent_taxon_id_fkey FOREIGN KEY (parent_taxon_id) REFERENCES public.taxon(taxon_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.taxon DROP CONSTRAINT taxon_parent_taxon_id_fkey;
       public          postgres    false    227    227    3365               Z   x��4J�05MM�5N4��5NJ1�MINK�M527L2LJ4O3J��rw��r�����S�>
�AN�A���
�n
Ύ��A��~\1z\\\ T�            x������ � �            x������ � �         K   x��4J�05MM�5N4��5NJ1�MINK�M527L2LJ4O3J�t����$Fm�gF~qIf^:�	D�\1z\\\ �^            x������ � �      �      x������ � �      	      x������ � �         ]   x�±
�0���KDoiG���Ep\����O��sʊB��-�:d��T1�綞�u����xd��-!uV�j�^`��1�����      �     x���A��7n��ɧȾ(�%˖JiCi�ٴ��� �r�6�w���WN��]���p��y�Wz��_��fqFr+L� �$�䥴a�p��_������~�/�O���|���?��o~�嗯��?�����7?��O�����|o?����w�>۟����������D)���(����D��Q���w_�矾���o������?���w�������g������W?����?�����߇)�BBH���~���ߤ��>��/�O!D�ԫ��ؠ�F�1i5+yR~!�?^�J�"f�*)�:��yDu�乤�'Q�/զ��%����%��$2(����-����%}�a}�T��#kSܡ�`cM����Tِ�T�����[׈���$�d���Gk�V���UlԽ�
3��%��� :*JOi����ǇU��G`���
��:a��=�dYOn֜?>��iz�.�`��@��.��ל>�z�?^kd�M�kUkQ�*�S1B:F��O���k7\�rY����̅[���=��&2�Cmr�ނ��!v��#^��f�q�Mf:h屴:"����k`��V�?$�ޞh�	M�5�Z���ZY�C��W�T1O�'ZoR�Ak�T�R��[�]ڢݤV@���h��or�&6�f�}6h�!ӣ��7�B�؋��''��k�֓ڈ� ��d������4��x��Z�s����������hʴ���דƛ�t�9ƹq�f'P8���'0bD��:����qM�m�`��i4*[�@��޺�Ol�䦃ֹ���n�Kܪ�5%0��+�$S�h��MrJ�d�*vg�b����W8�h�q=h�^j��Hsx����TV���n���Z͓%�>�x����>*5�ඞ���M���CG�9!�Żg2.�*k�6��W�x��U�H�`�Ui����5{M�M�9o:h�����2�L}a����rK�ӓ�J7���(����JPt�+��G�9�$m��7��T�,�(FK�C^�@eMP��h��O�t��Z�DTW.��'tr�%(��bU;=�t��Z2���W1[ft�֢,O{2G��ܤ��������pH�$�Z�&�}��ts�t��r�����e���P�
�h�m�7���頵j�s	��V��}hիA��9Ҙ�����Z�cw7h)
�L��P��)�b+or����Q�9�(L_ "q��x%	ך�j�'�D7�M�hӂ��28���P"���$*�OzN��M���c;����>�-a�kE->��O��J�x�J���A���KP��H��2���r��u�ð�VD��GF���Ш�0�c����>>��J�}��5d�Z����tE�{��"7��k��cH���a-E��u��0�6�I-��u#>��0j��yB��0�e�p=R��>�z��NZ�6)�+����W	�q��ѻ������81�u�;sm�Z���x՜pO�֛:|���9L�����{秷e��H������i��M'�+�U��vE�+SN�<�����]�{������dX!n��'�0�kiA#��*o�^䦓VO����)M�����b}��'9��M'�T�6��U�H�,a�ư�'9zk���d���M'�yp/�#V�{ĵ� �bm/�$�'���E�t�tY�U8�j-3�[�˨k)������Mn:hD��R����5dC�ܴD���7��UʠC��N�����'���\�or�A��u���\r))xx��Z���	#�Mn:h%A�]��I&�]P�$�@�7q�xNw�괼.���ř�����f��$E�zR���y�I��>\l.k�D��so��~Ze��{��&7����W�TM^���Ķ��3�y}���Mn:�0��l�=oʀ�<�Z}�䚪?�9����s�^�Ch��X�~T��8W�V�7�ToΛʩ��s�^�ڣ��!*sPE{�a��nH��M�Ș�����nY�6����u����yS��M��Ƴ�فj�0���V��B��Xd�d��^�&<���!�u�[��y/�M�S=������NZ���s��O�1�"�0v�(h�����餵q���_��	ӄ&]�VP�`��OX�]䦓�L��s)�T|/��Hd�l�JV|� �'Z/�7���n5+�����44�a)\�pS��M'�}	t�%�\4�,��b-Kf���̛�En:ie��%%�}N'yT�)h1�ZGG�=9�l��u��vm����߹��Y���}����OZ%Q�@�R�"�':�d��u�z��ī��{���������e�����Vt�9V�7;��^8�����Yp��gg�^I�zx ���餕V�����
T���6P�13N���<���Ӿ�!��Z&�e`���òty�|�������Pd�1� �aq0�����	7��y�Ik[�<{pSr
O7DivٿIO���&7�쫓����p��Eʌ0�@bp ��䦃��4��!��=� ��e�����s��V��mS������r�h�]��ZC�M_�7��N�b6p�#�q1�c�Һ2�����_�7��bj��jq���*�MH���o*�'3S��M���k^�d
��������6ʙ=?a	�6o:kŖz��1_,�`��uL��(�f�/׸�U��Rĕe���|-�p�������_��7���J&�h�H�Z������d��~�k�t�J:�P���@�j4�<E����^㦳�H]�Lu�c� ����)���|�37�7q��Mg��dz�
�K�6�;J�֓��^��Gk��Z;��}?�v֬�S�or�ڼ�Ր%�'��N��`�� k�p�i��&�׸�5K���D�ݞ.*�cB/�Mk5o�z�����CkO�KM�59 ŷ4Jü�>�{��&7�&�<'/��+��aQ��T����p�^�?k�}�*b`37`[��Dp�1J�#�<�9]8���H
ko�4.cJ$qO�h0�'�𜮝ԝŚg't���*���|���>���'�8�k�ԝ����/������      �      x��]�n\��}v�B?���˼9qN⁝c$`8������ݽ{��D��Y�Z�����{�ْ��j�"W{u<����7����׷i]�����v��t�Ƹ �/޾|��ϯ_����z����X}�/�x�:~��\�b^�ʴ�,�i[5)U\������U����}̫�Ñv��=nn׷�!�/���W��UsΧ�����Qޛ`�R|a��~:�yo�*nv��Ú���1>��rN,�����v{,�a����I����q�Op�r���|{���_���-m�/G�iլ	|�Us/^n��p��y�����oa��:�O�N��X��u0����NL�pT��+�S	織�������O��������nG�8�>h�/�-��_n&:Χ?����S�Y��%R�K�h"����z뼽rݮ��n�;�����I����n�N�����Zp�,��3*H\o�('�8M�O�VĲ��?>��z.�-�y��%./Z�͕�����P4n>�m�=ZGnظ��w]��?���X�k���a��"\�Jec�W����"q�$��f>[�jJ��x	�����Iۆl��t@�ª+��-�n�w�{���;d�D)���a�m��[T���Lq�𖋸���Er��w(s%:��A�_i߱����^���>&�o#m��{�&���cݤw�^�n}�v� ��f��V�fq��fn &�����h�	���H�֍�_(W.�E��c}@��+�u�N�Y��7h�c餴^.�� ������dX����h�iΫ3�w(�Ͼw�T�wt��ׅ.GV��	����6N��Y����f�kp�Cl5�'�D���T��n��y���7� O�@�ή�S\�YX+:"�y��7ـDUj<ŵ���Z|��iq9B�ΌOS�����@�e����r��	,�����J�ث��w �h�k�r���	�� n"���
x�xl�܇�4�-�J��ʻE��w�Q�fz7��im��0O���AoX�1|��2�S���i�wS,�<|��&E4��ȶ�VXb���й���y��f�%���-ѩ��7�;��W�:�&+�)�H'��;В��1�u���GƯ�s�|��N񖐭u�;z�Η�r��{�w���6O��g�`H�^"��y�p���D��ܦ���Y�����Wh:W�p|L���t?�v8]�p ��_�����}椏r���is��j��UGP۬��%ƻ�ֻC<7�_N9��戽���P�Mv0L�VWn���~��i2vw��pӆ��:4��F/���O���������!�h�����K��O�U3�9��C��/1����o�M���j&�6���Sxo���m�Ah!N����.Oƕ�f���?b:��k�9��x��DT����g�^���V��.��(t�E5O��ߣr��($��ZFy��m��OJ�����!��z	����=��iNk�*0�s��Y<�ܢ!}C��2�~E�h1���:Xo�X0Du�
i}8M�g.��a�"���	����n7Oq�� ����g}�Ԧ��l��]��?����w�#�����\�x���l��������xJ�p,��J�x��Ww[��Ck�M�����>�"��	�{������k�T���흃,K��@�'��N��9�e~���^B�	��{��"Ţ6?v�7i�Z�b�y�Ö���=�)�S^���u�.6�,r��㼛�`�>���l��uz#�"��~D��}}�f���y�;�}W����K��k��Ǚ��� Ft��ЭW �,BמC{E����auw�I{���u�WDT-R~�c{}?q�5n�G�X3�Ho�����ΔoAl�����������M��;���0�g�����>�	���L��/B�����(7%p\a�ֈ�����a���pBSH�!W�p�,Ҷ�����o=�jC��hH>u�n-��מm�M\k*�k&0^q��^C��z����7��-]Fg�=�Z���o���^��.��s�0in��q h��oЎ�FO��.�h_��T�tw�U��\�t���w�hӄ�����y�Z���N��/@pS9Зι��˛�n�t��Z"S����/�'�ֆE�o�����Dz_����0(A��󾇔7K4�/���Ν7)�V�%�������� ����u�G�!��Ɍ/�ˍǕu_l��K��/��m��r������޷�n���gWiz"+A��Y;p�F{�c�v���_w}��_��q�����FWۡ�|�]�"�=	�8?^�����������9��"��3�z�F9��H�{�}��x�	���1��"�	@O��lgVG�����>�I'�X�����y��P�jak�����������%����f�F,����&�zo�:�����]��}D��*��h��6�&��"S�_��X6~D+��������<�'#e�L���f��'�]�Z�����^�_����faK�7��x���$k���EU�(�σ��^�p��J)�Yϱv%Z�"�]�Ŕ�-�v�I8/J�j�Z�}\E��Q�US��a�^�0)-E�]%���IUVL��[������-º��o�H_�`B�e��εV���R�.��t*�N�.#�9��Cq2H�8/á�N�p@���e����0ⶰ�S"n��u���_~f����2�N��
g^�h�S-���á�N�0B����j#��aeͬ@8����d���{��*�е2t��"�ʤ�Ɖh�w�+�0�aI��Cх�"&�L,h�x��(C�K��}a�k�$%˕+V*iV���'�7���pl�E�
"����L��%l/�d���pK��Q�.����z�4��JƃC��N�`l�N���`��� ��6��` �Pؒ�^�R	���!� �_��x��L�3�z@̎Q E*h^�x\��"�qM�I��{��K�.TUݴ�a�P�KgC;�I�
�J*H�px��"�I��b2	T��v �L��'�(SN:���QW�P��d ƹ�,_C���3=a4M/$x�����p$���'���Y����E�0%m5�SA�Y���1'9��a����/�߰G�Ge�;�d&���[5	ފ���p���"܌�9d͈Ja��b�X4Sm�� �_��E�p C���&�n�
d״��xW-�r>��)�e.Iڒ�����Hd��g����D�E8 ��/9(�Cœ�H4�$�]	Á��0J����AIO��9\L)�i���B��H�%E��9��/FG���T�E�����LIyi},V���(�C��8\M)����Ӣ�z��C�9y�)--�%3>l�C�	Q�BF�(�PFKn*��v|���6�R�7,j���h&A�"EK�����E�p�6�:�GB�. f�U)�0�����~��C���P�ꯔ�0���9_!nm�4�q�X"Z)^dDl:�>(�T�dPJ�y�"Zt;�M@�ύQZ��7��5���j�ؒ�O���v�R��-!5�;� �!��yx�j���`,Q@�Fi��5ˡsJ�ΜAC�û���w��D �CO-�ٌhB>��Z9���!���٣��6r�AU<�^�rY�q��:�[w�f,[��DaHP9]���x�ѹa��5栕A([�L�#)gJNɏOS�C8�"�������i�>DO��l���O�����jC�F����	�%��J�T�x-hx�C�rm̠�Fd�����r�n�H"a/�'��Z�����&�r$�ҡ
g�]��Ó��f6)6��(9�	�Z�jPTr|DU�CX��A�ETx0%�
��H.[0x?\͛�a�M�٢GY��HX.�������y���͘~��>P �M���A�}ʥ�5H���Q���at*�o¡�	��Y�d�D4�꽉z88w�!d�:�Ĳ�)H�vk �ЩR��je����.���̇�ׅ��RW�D1�����;�	���KUR�� �dA(� I�@h�×��KaR�l�m�k����3e�Ԙ�<Gb��V��C�Ȕ��6����ϔv( �  D�ڥ���pie�C��Tb�'�t��&�[a�5M$;�Y��&	5kiB ���<R�XKUza����	��2���\#M9�&K�6j���`�E���Z����Tm�A�K��X�ZrtR��Zd�sK#yHTXu�B߉�T����u��b��u8�A��6�F�4��6�A^h����j������!��R����w#L��b�Q�Fo�e<���FiJ�����g����l'}ñ9��v�� �hMH^��!�TE]�R
ë�}a����	FJS;��+���AEM%��&/;�m�V�Aq��Je�S͜R9r�:�oNu:���T=K2i� ;��N$ۧ��"�pU�zR�s�ڰȋlY�9hPks�Pn� ˙�p��Tmi�h�&��f!�T�`l�Cj;G��G#�@a�]d�^D�M��G���.;���Ω�v��$�.��[3�%WP���{©`aP��-Xbm�8��
J%p�,�:�U��$�+�����%��'���ŋ0|j����d�.�:�5+�Ag	�T�29
���{^\v���c���"K�C������#����v�9AO��uc�ynT�з���'.��>�08oM*H& e�����,##P�z����uC[	��.Z�dH
b"U�fx�6�O�C�M�uPo)O����t�+k�����u�@:FPq�DF����B"B��/����u;�%w"Qux�q,F���ba���+�p���&�g�Bs����2��9%h��g8�����'���;�����W��A��x�����pH1(|f|SZ&�T+#�7�6m�x��>���!���^�ժ^��5� ��e4*��/�k�`�JI/��b�Ԅ�,$�(,ƈ�C>�k���a�6"���G���RR�]N�6%tʏ_�Ka}!g,CQ�,��4�.3H�$=OZ��b5��v;M����`��\(� L�+�J��f|,�_;��4��۝�EP+�:&7�r<Cn���d8	���%�iɹ���t��h����}a��%΄�����I�?@��ն��pl��!�U1��ʬ�IҞ�,��FU�2�;���"S����E8fb��b�P�5���~8�\�x�ͽqIV۩�6�:��&���F��}��$������,#o!!8Uk���	������]��������_*      �      x���K�,�q���*��@H �y`;<��M�5��ھ��fܮ����������H���<#/K7b�n���n�e��5ԟ~�_?����TJJ���\�+��wJe�����?��_��_�������������嗿��������ݟ��_���=����K.M�W{�=���O�~47��nh{N�^վz�O*�"���͝!�)���\����9��/��;�/��ܴ���g�=iw���j��p�����}���"a;��\���Ƹ�ũ+�S���"�޹�a��%��"��E���νN�=T��ɾjX��KiNR����]�9�r�j�_�PD�f�B������m���W�ߤ�H�c��>�c
���T�ϳ\��'����m47��]�O�w�r�"n�3]ms��}��V(�[�ά+d��{�y�)i��B�PʏN����;�D�od!Tzt��i�V�}RJ;���à]���4�*Ҥ��o	!�!��ٔ��~7�WT��\����wۘ�<L�j�mK�n{]n�A�r���Bd$Z������N��ŏ��*�o�q)�8��po~m��m��d�]�l@�8k�Y�mUK�w���ˍ|��������0�JJ5�'��W�����BO��3�		�3�η �S
>�a���Ĺ�[`Φ��ɮ�3[d>�P��	0�s�x\��8	)�`HV�q!��-�!�=[��i�^�F�͕�䱢�d��@�X�Um�'?����y�%!����<9Y�9@�81��@V���'�<O�p��[g'w�(3z�y��������]hZB����t�, (��0��@%%���p�pQ���ܯ�)�G�C[%7ʬ�Wpg���#	)cO]O����
�WQp���S�� ���v��4~C������TRQ��\6�O�i?��a���+~�p �;���d�ė�|h�^}�{j<��p>jp��6Ӊ��'2�[���q�\ֻ��.vܱ%��mU���� �ソ��`�����,ڢ�@S�@�D��ɛҩ��3�q�j�/M	�h�����M�"��%�����\��0���u,��"/1�-�2�%�+���@
�E�3ge��z+;<!����	��4p2�P})k�=n���o/��jD��}�5@=!ȕ�2B2?���e��ڀ<L�z��?}]��>�V_��m��j�5	��f�;=�vV���X�� P�d�*��O�����k�$�Ϸ�4ۜ.��$�y ᨶ�0���񨦑4�.� Y/X�GN=(F"�5:�ڤ}�q�=2�!s�q��aR�()3O�ﾃ�dq0�q�VOr�������<˛w�vdX`��{D���&����l%���ݑXKa��Q�-�巸�PM5�/:.�����FD|g,��l�l��@2]�<�t4�8����K��Ņd4����.l4���h�3����
*r�呯k���ed����ڱ����P	P�KS��d�T������,�D�8x
�h|�Gsk��~�0嘰t�H�m;�&%'�W��"L�{���Fe|�ӎ���Li7�>?L0f�E� �&�
��K�*�-��,*�؄@c�8jj��x�xg%�W�Fh����W���x�pƴ��)�f��숁\6.i�*c�v��{L�:àm�I<_/���
�5��B�5A�[}Ѧp�+`��)���Zm�����IR��wEA��|_��"��y)�'"��k���S���j*�!ן�(!0�� s���R�l�0A�n�Q� �G�J��S2�Vy�G��;>��ɂ2,Xxs�ȵ1��R%|�Z����o߾C�=cW�{�M�f����+�9K����`�3zW�� �&�	� ��k�PlE�R�k8h� =�@ ՛?���!LDyB(�C�/��H�h�h��x��[t$���HDY���?	�^�	�D�n��QM���ў�,��""g�#cL���P>!���WdJ_�Ɖ6��y�߶h�)LH�O�r+�	%J��6i�l��5n�5!d�C�����a��ͣ�Nc/4}MC�y��1����h�1�U� �ZԌV
i^�TK��2.E����m6xE$�y�p�Ϻk��산���v�+1�˜��R}��d>z!ݓ �;��G�ˣtȁ���R�al�1t�V�<k1�A6E��,�_4��[�FA/[�ul�ӮU�T?h>Z������S�(���;���M��[. {�r�s���a251��`�� �
8��QMĉ�F��Q+,G7"�
�fMP�m�P�o/��h�ڐkH"�6�f��"J/к.`d+ ��T���OnbkĒ��^�`���!�>����b���a�t�K��Y�a�!KL�ak����� ���(� ��D��/M5�&������ȣ1	|7�wH���>�v��C]Ӊ�_��}܋xB�_�l�6;)$dĸ�H�g����8��k�>�I9L��͆�r�t�?�rB�� �]3b[x�ɂ�ǶL�[�@i�.j�j��7�� j:�^	�,���k赖�}�\����(�MNJH������~���t���ab�-�42���(z�d��Oü$x��g�(�u�b�ɶ;�ƞ�|�2u/��u@Ǘ��xz_ѡ�6[��ޘI�B���7a摦�*ME�ǂ�fv`���^ ��%Y�d�#f9�Vd驠��U���>dj�(.7p:�l/�Q���x¹^�I+�x}4ߌ\8�j�h�j��n�E ��gI	>��<��"�t:%WVO����,�X���~��0�~z�r�ޓ| �ϳ���)Dg�q�Y��o�Bc���Kf��z�B!އT����Ppk�6"������CQGT�dgX+7�Uma�4��|:��$�ce�i8�����gׄڋH���ٸ�5���h����m�^��j��w��:�i%7�����7>���tz��`�$c�瞔$gt��Uo��BP��#p�ʓV[���m@���8-�G�˘�v�i4�
J�l�۶#B��V� M!��)�%g;�®&zA
ϟq���U��@J�B�]�H�d혻��W�n�[�Y@�ǐEH8��r�]|n�U[���<zaƥ�c��
1���#5(��v(�^V������ p��i.f,����?*��M��;���d�pY�舩mI��q��O4�f؆��Kת�)�|h��$��8[8 �afDL��f/�%�!��Vf�ۉ:��N�@�y}=��4Ƶ�"8�p�p�H��La�d�2���Վ�&2^L�W����F}�(jE�����d%��������m��Dsr����Gs˯5x�|K��N�������(�V�܇�[��E�
v"�C�m�WͲ������h�3�xWR��ِ�L;�E?i H�ړFҶ,h�n�����~G��{�g�.0�oʲ�%^n��U����Kv؞���K.��P���p9Z@���,�������x�:/F<>��s�m>b|�δmO��D�;�z Pק����H��^�Ê�@�:�T�l��Ott��{�}R�H�
f�{���Y�M5�z�mP�;C�&\�#�9fn��ܛ�FeQ�8d������v�ն�/�Z�,�jG�v`��-���c�1�̜��;������O*��y������uqծ�t�V��R�3�!�|��J���iGj�`�>pum,-�w;ܹ���%��"� �&�;��l�K;��ɽ��= X]���SC�fϭ�b.��ܗ�_ �l�1t�O�8�6㟆_!A^�c�|���o�v��o�5�C׋����3�a���-�F����]��񔃮��]%�n�b��{Cc�q����Y�J����9xS;���i;�v�I����uS��,
��n+X�7�oB#��v�)1��4����<����e�\�Q�>�VK����?��iڂ촘gu��sJ!��p{�7�0e1� p  �����uCm��,��;I��� }Y� I	�;�~�KͶ�5:��#/5�s8d�C�v[J��e�t$�q?)+Ӄzv�48z:B֫�
юj�o�������D�{�n7��Gu�I�a~�����/��v�KZ]�R�������넎�3=�[2�����.O}i�Oʐϡ��5�)���O{�B&�|=B�ND^m>m����m�R�����Jp�3�l�m;(�s��r�z}6UU����)��U:H{�PvC&LӰ��x����ƥޑky����Dx�vlI�Q^�!�_枷��t�Ö�$��{��}���ɂ���$G5!�{@����By�7*�V�7	�땄����}�$��>�����<~L��H����=c��Ѻd�BF���;n�ێr̾��e�A����:�O�X=?U���=!�EMԬεs�R���"�K��"�n�0�/�o�܁�ݴcI���<!��{�N�\MAgn%]v	
���k7e�K�uזXeZ�u3�`�;xm������9��
�ƌ��['M����mA���{�����͂�;�
vZ:X*<���a��j+>{0*]�g�O[�T�Vm�v��xk}�YW=�qSީH�'�!��ڇ2����俓��ƴS�&�+�ao[o�X�/�Jy5\����Ds����9T\���Uz]G]1�x�{�v�gH��ƹ�E��D��)�b�L�������P�t�L��>)+i3:>H�h����R��@���M|�)��^����D��͋����p�1��=]r�v�&Y5�	thAf��b�%}mer�Y��X����drUg����b���k
5������]�b'hs�j�J���<��]���YHZ�}��S�j�������d,E�I��{�y�w�_h�"�ja�K���+�����rl8|�Ρ,M	��s�"�+�J���~O�t�������KA�P��6i��L\�Z��+ͧhե����mL?Ϣ�T��`C����-���2��ꃡ���)c�>�nփ�]��0: tʰE�v�7�u�-��z�jY�/.0������T��4a�v���%��?' � sŖ��j��gɞv'u]O��:�+�������k%��      �      x��}�n$ɑ�9�)�8л�����6��vh{I�����V�E�&���m_co�=���o�7�'�����RD�*�MfX�}?��^���"_YYۺr�$5�Z_��#��?L���/���ß����?����~��C�����rq�6cU�8ۘT��+��;~f(��F�X��"uU�c�G�6�RK�~�?�_�������/��?�A^���?PJf:^4^:}���o̔n(��:�wO�o�yx,������]޵�y����z)���v�!�^�r�]���sc�(�ɆRx �^;��vV��N���>Jsz!
:}�D�~:\p��1pq"{�_D�����}����n��_�}���y�jn�u;�o�O_g��{cnʸ�U��OƩ�JH���R[#:~
f�вCL�2èH�����9V��.D�_��\�i��󗾹��5u_�u$�m��F�cJ�\����!I�y����q�R1a�ʄ�n*i�M�٫���������?hB�T��W^ޏ���R�	4�,/ңr�"jA�!J���1-g{����U�j�<\2:��F����i\�BV!H�r1�F�dR�}�7j�
���p�s5���M�.BQ�y�P?ww�%D��̪�U��vŪb
�! k#M^����w2�G�ٔ����ݳNKIc�I�f�Wf�Fr������x7�P�#�׊)���6�n��6�h��F��ܲ�ޒ�����8ls�1���3����pI��y8<����}���ۇ9౸��Gk8�KC%�gL��^|���*ѡ�Q�	Ю<�N��+�A����F��٣*x�����������BE'�	��l�t}��?�r�sQ)A��LƧ�YՁ��J��P��nr�ذDZ���Hʒ��5�b#��V�m)g(�,�g���e��E���v����S��G�F�I��X��m���1�Uba'� �w�w�U�7w�Ö>�1y�~�t)J,�b��������ٴ��?�[������O��E��������<���:À��2!)]Czf��TQU좋~)DtL���e����o��޵�t�;�6��M�}h�&$�|�s�>�~�п9н��L�h�`��S�$hUG�=�җ��B��E0�\GCK4�K<�(�Wu�\tRm�p�@QH�L�F�a��K�	~����G���
�r$��G����BF�E��G��b��5A����o���l.�:�κ��]��b]ƈ`�:Ҍ�Y�)�0`+ �	��L�����'U�6��6����q"�r]?�t��������p���ݽzȟ:4/�\�ཱ�900J%BX)@K1���*& �W�1�CG��Fu�����h8��2���9#mH��2���&I夗�qY9K�3(h��U�x|�Q�r(�bi!�>�Y�R�@��GE݇���W=��_�=�2bZR&gO�%r��DQ��z0�c��m컼E�|y����7��g`�f{w�^�]c��%9U��R�&�E5��﩯/�'b[!�}G�8+.� �lJ�i���x���t��Wf�g"�I���wt$��T�ȷ�)K;��LL�%�W�p�����{�	bJ��Єf�$�v�+ڗ���~܍������||�޽
�L�a`�&��0J�G�K˵��*F?%��D� �2~�k((�\M#���P 5��fI\��7$�����a �pлw$�IW�I�Z�3ͭve�-�ؐ���;���(;��V��|�1 ���Ѡ#�x�;W|�7Ap����U�Nڸy�����T�����3��U�� h(�X�U���.����H>-���$�8/3&i6Fo�J�j��w���P�>�����WQ�@��a<3
�!O�mڔv�N���;�v��8�.�3��\����݇W|��G"�h�(Yt8�[�*O�&��N�簊O��Pl��@�젖D���n �DԖ"�W=�+e{��b/��
��n)I�R�h1*�i��RY%Fa
�zS�a��(��Q���N&�2qZ�t�x�/ݖ���������2�"1$��<���.C�i���*Z�"�yW�o%�
�kWݵ����š���(i[^1�7HYlMN��ų�ɨة�� [i�K��=�)uӓƯ1���N����1��%a)K�H�y-���_���4��JZ�x@��0�j�i����h�5b�B����ުnVk�u	(
q:�K� �0�L���(U���R=���E�dBBI4š�S���@����6����6Z<��;�
ci��35h�f9�#e���(�czHI�e�&̡�#�ٙ�G3�6/M�n�* M�p�-������5SL	��`P!�3~41|1j�d�PR:H��ɸ��kNf:�V����R�p �ƀ�=�7�P���8!�b	F����3������/�\����3��df��MXy��9H�"��T�)�|�"1��*��)U�#���e��;e2ޟrr��	�h����vJ;?�5�f�c�F��(Y�%�Lg�M�J{�>��Ϋt����` kRQ� iR�#���J���}��&�d!��ك9vҩ}5s^�ъ3|�z����Ԕ�*�>�>*�8��1Rm���iI"(�>d�~0���9��!']��R�"�����PpnQ������e�@å�=�3��Ȯbpl�:A$U�8ȡ�fN�����}��x��%S�`���f�˯�KK&����p��
^�A�Ǡ�����։D�l����w"�<��H�F.���i�z��ƚ��$=c���4���K���n�O��f�6�7J%�R�H^9��0�Jw<Rm�k��J��-]�<�&-��#7%CQIk2�	K�c�`|V5vf�Ĺ ��P�i�<���a���w���4J�:�p�DM#;d�� �bQTec[��[ʜt�<b��W���	D �n�|�ܾ�Vt�GeYd�^E�1��܎I�Jc�Jx�O�8� ��p.K�cNk�&��13�"��zmp���n{{����vc��E�7�sBP^M�á��JP�ԊA�9�J.Y%�;$[Ii�` r,>/��������+�7,��&>�����㗾�?�J��K&&��U�h��uC�0d�$T�)gd�*1�਱�>ZϊP��0�x1÷�6���~�E�������e/��5��C}G%��x��((ޜB��kZ%<����U�.��w���9֞��K~��d�O6 ��RzQUSwA��jY���=>��ҋ�ΥF/�Uh0Zs���U� i���SR)��εw�%�B�˵�u7��^���tA�7�~�L�3!�u8}T��Q�^�s����:b��42H`�����V���7��2٥���0'��W����K�]�OGor��(F��V�
�	��6�	/C4T��ǒ���\M�%u/��=	��bf�0|C�`�9�+����G��q T�^+7<��-5�b}�>@.��`��TX鈿�$�8�'�q�2qv&NA��Np �S�� QTC��R� �%� �����iҖa���u���@o�2��!�s����.�z��X�>��,��7(	���:,�Sp��ґ; 	;R��V�L9=eد�ؤ��JŴ�?��Lam#�gi	U:�"�\��:^�������F +{<���b/�"넀�t�� �@��؎"�`��xGK��<�I��z�4Y�P�P7�5��_�@�z$���ĂOG���#Z�(`HM�J4̔t,��j�<���e���΃�]��W�>�ˤ����]��}-ߜR�d��h�B���d��9¾^%Rvr%5�XB@���A�XF�e�ݔEc�m�s鐾\���z��+���������v�8[Pp���B�@́dh�k���Iq��@�ʯ
���4�����qu�"Ӏ�|����p%�`�a������r�ȑ��aB.��Dʇ��>�:@�ɬ��b�x�����6�9rX2�tV��7r��ܢ8i�j0.��f&�e7|lU�w�����Ȑ���*Kh�_[H�!�Fj*�!m��0%G^�lw>��s��V�e17�r�: )���� �  ��3)�T���H}���=v�P�MM"�A�9��T���/ ��Ƃ��#<c�Yv�]�����Yq���*��?�C0h��{O.�"�\�2gn�ɌA2���THP$��0.��w0����������xi�v�wҙ}�%���%<��@��%�ːv�:ɑ���H2��<�id�AW�KaL)��E��Ov�4f�g��
���5Of�1�	�PA�F�\4ِ:F� �J0�� ��v2�!�}_��8S~P���:�E�Ч���B�t$��q#S��\)�#�}����o��(�����8��E\MG��M�$St>u���Д�ϲ�Au�x��JE���0R �S{b�e/���L����pf)�g@j	�5��m�:7p�B7�������W%d���GT�$/+���FKx"Z��/�-���������3Üe�积m{Rgw�~7! bU����Q�V;P�j�����*���^;ԧɪ��]O���)��4��;�\
� ��/~��Ȃ��'y�0���9 ������
o4tH�q���<�N��ҕ���#di��p	D)'<~R_����K����>P�ΤU��.�G�a_bK!P�ļJ�ȃ�j-�S��v�x���TY�ʆS����@0}F3��[����x	�n/Z�)d�d�FQZǠ��/%Sz�1Q�,����b��lB�����e�Q�w_��׼k[�7;�g"2�sU���F|x-�M(=�<�Xe	�C�&�r�Y� �>8y?JRK3��<��erWn.C��3p��"���ˬ�0�f��z��bgG&��j��b�UV@�� �h�Q;me{��,n� ��(KHA�ž���i���I���^�?��;0�^V$�}'��6w�n{��/O�w����~�O������͗��@��������~.g� h֮�.���(u�|��Q׉���ɒ�U��I֌�4az,��y)b���۹��Y2�â�ͻ��M{������6����H)���A�gw_?�������ׇ	��i���v���{<,���?��F&���V������#���P3�lP�MC��P!�u��4��=i<8紧�N{�^]9��Syfr����Y�(��<_v��y��`���K����_٠�9�lÑ� <�:b���Z8VT���g����h��ͷ�w�=˸�b������Օjy���?o���織 �p�����"�T��G��"���Q84d��MεD9O�E��r���f�Zα����k��ɷ�}�g���a���@������p9F�*�,]5+���YZ��W��*�d
a�|���L"�?���8�fq9�p��u���,C�|��� "��������q���ޢ`^�����*�R�N>�-·�#�uB��O�l�,[	�O����v%��%��'x�sqV��58C���T��>\���n�&HKI N�u`����8���E�b[��,���=g�}��D�M:{�^?��^K��9�&�j}��l�[�Ӆ�`�T�x���u��:�'�k�ʖQ`D2�EA�n=U�~q)B6B���p3!���y��_�]��zݶY�j2���M�s�O"'� ѧ�=���*=����1z.���mc����@Ȏ�4��|��I�Μ dO�v�4�?w8��˸4 LW���=�駇8��tq*c������uq�q��I���3V�d�v�ӱ�����#�z��Y0P�['��*˵!MZw�ގ�P/ɲJёU!���[�&�cK��7.sǖ��C��=��ퟑ�U$�31�al�Md<4�Ib���7%��ĺ�U�~�Sc��|��p2[�c BUgk�ŋ\ C{E�3���g������0����~��>�Ť��$-�Pwv^qkF��p�*1���0i�]��tQ�e±z$�FT��ޒ��s�M�v�!ʧ�Ǹ<����I2`�U��ڽ̢{����U�2>䈮��E"����mm�y]S��(�%� #��*���+�;�������l��������}[����LH<[������^�[�;��T�Q��U:r�7ؓ(���r�/�!�,#��}�7}��?�-4��oˀ�CU����T]Qʰ�U#J0n����^��Ă�*V���bR�ҍ��t�[����W��i��o�#���C���g][�� �MU�u�+�S�� x�DtS��] ��+����!\�8�v�<%"����D'Z����;��^��O�My|����j��ZY��B�si@%��Q�E�����LZ$��������lW�Є�M��t�i~���0�t|����w�~w�Gǟ�����ݶ��n���V���΄H�:d�XY:���E��jd���*P8� �Ȃ���{Ur�J)Z�š\�(Ӟ2�;�i�D�?�HX��A ��{�r4�/��L>"5l�m��X��"~�l��p�2Q'�:��E�c�E�_�����&Ni��;d��2�K�(�����$m]j�xW�:r 6i��QT�!��+V�%Y�}�}����l����e#����\]����v:�"�N.D�(�XG$9��L
��RV�	y&�U�~y_��>.Z�a���o����~�wy����O�0G\r����MgXv-���,i $i��F|�nb
��O���.��ZO�����18�MǇ	�Ú�U}��;��_�l�'MVΒ���u��BC��]2Sŏ:�d�Af���2b�\a!��b����-�n�pD�����w���:��ݦ������R-�A݊bp@em� �l��5q �r��kL��&ɷZ�� ��Ev�6������}��kM�D]��yĂ�ێ�[��"�rd�zY��n֚bŧ^E�|��h�
2Zbq��&g�X��G����\�c���7Z6C�{C�a�7��?m~s���v�7��i�u��%� U����2r���Z�/V�D�Un>r���
0 YN�CΌ$�c
���������{2O4S\|�8���~�b�iMo�tic�nr�d$�r;�*��p,Qs��J4 �����[)x�+W9ݵ�5�s�[�2��.�=ظ���?��E���~NU��CC�t�J@�$J_�ܟ��5�h`L*8�'���L\!_rlN/��_��&*��6 �<-sB�>uj� 砏k�Y��:'��	j�!��pj�E\T���L�'haXZ\�?q����,7:9~1IE\���&�K5>�Q���e/{R��'��Fu�u�>M�i�+(��a8���u���].=�ӿ���EϪ#{x��� �'~�i���on��~����JύF!Q�Tx��m�>}�Yv�)�=����)�&��kq��^��j�qD9�6�bj�Vud$j0QC�dl��y������O��Hyċ�F��H�a#H6>X����#��j44���*�C�i�L�͎V��j��^�<gW+�벗�W�b�ZСŤ���`9�t6X��f�P��!�K)����ư�E���l�E�W����)�}\l=�����α������w�}�_}��      �      x������ � �      �      x������ � �      �      x���9r%9��娻��p8���J�����G��3�Ğ`��=c%����Y�U��C�{B=|�7�[˜v,6}z�'�Y�)���	S��s�J����>���ӿ�>��?�n���_�����Ѭ�KH�k�n�;��CW)O�L����V7�f��s����W�OL_�����݃u�f#��R�{�<*��~��]��j'�^-���;F[1���٥�X_.YΪ����ul������μ��֟�,2�]���F	{��Iw5is���UX�������S��u5����B����Y�Y�m+T�#��sSCjQ����mO�}�W{��-�:[Z��E���XS�]n;�j��)r˘2�Qf7jة�`����)&��|��btMc	�gY�-�����U�@��u<�`I1X�7PviXv����ʙ����ҋ�s� w*Wh��7��=�ך;�>;���X�t����Xk+�9�%�4�����U���P�IY�bxY�o52��Ԕb�O�Q�&���s��5FmGM�d�'}5���f�6�&�gu�����2�k� ���g=�%��RL�dӁ{�4��J}����+�7=�:к�\�f�����%�R�9 �viro��7�kx����[n��^}����k���	I��b�����P�=<��h:b��6��u��vN�y �Wmo��t�q������H��f�sh:M��h�Ȇw(��F�ѓSfv������>	�78G2,z%��
g[z��RrOa��p�P��i�S�\������+�ۭ�BM��>%�Ju���'"��)
+�rLÉ��%�
���V8�}d���Zčv�`)�o�F��RC�L�k}@\i�:yn�3m���8rꝨ����rz�cb��X��� joof��hi�i]p���F���V���w{��6��^�jF熘���e�`�gx�
�b!.�+����؁*��e&�]{)y��r8vP�{����ً�"�.���;�����8q@p�@�c.h�2xy��8c���$�\<�.�l�|=�rR[Oj�fNH�����e�z��.� ^ߍ>y&�k������"k3�))������Í�w�c�]O��/�w_���/ʌFa6���**�'��8j��Yee<B�T�f�O�����ْW�~�]��mT��c܁�9a�����s��7������t��j�i&TC�#���:�շ>�17vvu��-�e��PZ�`�'�ߤ�Vc�Hj<n������ɲ<:����V_F��(��ë)��q��j�n�(=� �HZ�Ǹ���cR���t���t�a��kχ�N-���ы��Q����j��5����OՂ�z~��/Bt!�=�d�EJ���U�j���];�Dq����"�d�뮟��+gAm�,O@�>RosȂ���^oC����͔S-����Kû�ɛ��!8!��lP�tH#�X�f����i�R�ь���W-#u(¼%�w�5��5�A|L)����m߂q� 0�xi�:pusT�z
,g�A,���M� p���!��h���k%69��1��ɋ�+͓'~��1C �����D�R��\�Ѳ�7�6�*��qu$>C� �Nr�8+�NX��}ww�ʲ1���Њ)����v�4H#�,`z���̚*�جس�Ș�䵎�#Oid�|U*�ǧ������{��_9���������~u}�T�3!�yZ�.�d�L��/�Q�X�����@ ��4U��X��h�ԉ�)>'����1F������:���t���Ɋ��L�q��)cĤ���c./��x��e�.�i����Y���O�f=0�j[���P���@J������0E8�A�^��/��t��>�9�»��*����ȱSr�ɾau��k�9/`�E�S��`����i?{�z9��ό䚛�SC�S=�2�K�C �����.t�����e4��4�߭�T��!u2�q�%..�t�|���B�~�+V�}A^�����AFJ�/���i)��%!6���	��� �n�nV<�k���Dx�%�1������n�7.wֻb���t,��iP\��Y��Ir)�!9A�|�#"�סؼ��[n���jsA�wEDd����K���&u�fBL��� v��	MZ��މH��h�w�	>�a���oy:��^�^y��i$��{O�>e��;�,q�K[�?
��:q8MW���¾.��h�o�'�<�6��K$�8ɛ����Ta
�>HUߎ^j����q��	άp)Bf�Ī����\�����d�
`�<�lF�`��u?%4hZ�)��p�76aڦ����9�R�0L݋�Zw�9���n(��C��F땾�qa���9�a?���K�����Ԋ�$�a0��ն	;��CW������>t�S��ݍ'�K��{�8J�}��+�R��3~�G�2"`IE�2��r^=Ұ��Ҟhh�D����D �R�<�N�=?	��t�z!u^����M�v2m�W��Ș&�S���hw\�G�z�n噎���Z]`�R'��b�H�DH�����R��Ԓ|�}�� �$Uc
 �ou�<�j�0i��D	��~�rr�`n����Qd5ڕ@	�S�0=�tW�<�;����Dϐ.�)ܴ�J�=�C��^|�FG3����ݘ�LvTx���%OϦ�ω���?���w�����s��)xu��:��E/�w~���8���s�3�p۲��N����<��s�UHr��ɝǄ��#�<mK�Ъa�#.�g����[��Q���`wOs�$L���ի�#A�Ub~"�W�Z�/,� )��S����@����ֶ��:���Z���D��Ҿ�ڢ�J�ur��[#!zKr�zF+n��5���L���~�̙�Q�W�b�wW
�@ϙ5&�GYu��k|��������8�}g��-<��1@1����Ӿ�+Kތ<���^�����n��Fa��WPB��[WB4x�]_?\��k'�Eg�"���h�;_:#ˉ3���4�	AɏсH�E��gw7�qw�x��[X��pK��φ�y�ZpN?h���m�,O��	��4���oF7��v��vhcϩ��oN!Q[Rh�#1��f�cQb��;��S�X�^��;D�ͱV�t�d Ǥ��{�����r֘���y�*��3����jw~.&�w�f"�W�~s���Lm�M��:��Wdٲ/�#�՗&�����0��_���t�=�{��z�^��$��L��~K��A���Zn�[���1X9��tU�:�c6��ķS������s�/OX^w�[_��x0f�)�a�~�t	j9�n:>X?�����$gR4�X��e�7��wH%[��|���OvH�!%����]�n��%J��^�kd��]�*���q�p��Wv�`
k6��7�G?l\�@ܗ���E�5�;5���˰���`ݠ�-?M��#���Y�D�@z��@��Y�o����.Xn����F�.t���b��g�p����6�y��[�+��9�/vH	~�^��d`?;,����J�ҭ/�,[�/�'@P?�?�2���oIκ�����Do₽��!�]	'��-J�ǅR Ϋy���hA�;��UH{˯��D�X<�����M�-�~��dLʛ��2��
�am���d/?�Ą@�>�Z#1jq2#FX�@���ѝ�m�_��nҫ��y��&v	K�:�>���H���^�I?p�|C���8 �B����L��l^�E9�d ���]���_4gZ�Z���	~h�KR����$��]+�.�,��(���뷌ŏF��1�����)�g�%�v3?�Iҙ�DBsB�qz�P�S?{���s��H�)� �uH;��)�t��]LV5=��)�]��!�ت���GH��nͧ)�J�7n��������m1EB�mye���[BR�w��V����ڭ�j������D�hH��5A�;�ا�������&Z"��
�[p�>'��y?��=�4U7�fm����?/E7u�g�iC���ɋ�/��y�S{l�w�y/�Г�k[7^*S4�� �  �Lɐ�v�| �# 5�������ݠ��I�DC�)~^�6�{A������~�����9WF��]{v%/���ɦue'�o&J����f��J�~;��cG����.��\����'�ψ|�������|�G�-��Z����ٌ��ٓ<q��+U��9�N�.~����W�厅�l?S$kNb�!�E���̕�f�&�]�$�+�c��]ke�3�(�u��~d���0�|����1a,"�}���@�hx(���ĉ��h;zя��$zR܈��e�r|k�4w��Fzne|r���KL��x�t���Ӛsa'��w���U50��N�}��w*X��2J�m-�E�M"��#M����Ȫ7�u>!lx��ď�Tw�y�4��������oM~[ZD�� �� h�"��g-�փ�����S��r�q�N�\�&�[ř�ٿ�	�����=�$���OѴ�m޳V�g��O��i�o]�GB����_� �=�v�B�˗h����J5��u��P��n0��gl\5��
�Iv�/��bD����=~�|��3���,���<�<�@��K��|;=V,?"��� <DU�@��~.��(�X�0�~v`��Ð���w�h�E��VC�%��a(ݻ��I5f,s�����$��4���k����qEb@(��N̴�3U�/�RL0�qI� 3�Afu�8��
Qk�)_r7���.�V�/�)OY���.]��R΁��t��1���H.�K_?�˹�a�s�O�|��_���c�q.4��g�֮O�t*��!5Dkz�"	��/�.
��Mԝ�8q7na;	L���I B��IZ����`rq��]G������;�WC�y��#��>/�Ю��yC=�ɦuFxn��|�,s7J��'d���?�����믿����      �      x��[Y�G���N�D)�e��.%�>�3=�k!� � (�n�s�bmd�2�	f���"*������<4�,��$��H6���#�K�=->����x��뫯~��׻�Д�����ϱɇ��q\P��i�a������/;��cޯ��tX�7�~w̧�����q����)�?p���?>�.�c�]}��oO6��_
핲�U\")SK��H͔aJ)��<�6�S��]�_	k��F:���plb�Wq�����c�;�W��~���n����|�~
x��հE�U*ţU�x)"q�w�$O
uN��Y6���*�a�c���w8�C�ԯ��Ջ�3P��B�I�^j�'A�H���f4�:���Zh�G����k��y��osw��ݡ9��ۻշ�ٝ#͜��� �����j\��R�C��n��Nd���@����^�bs8vm������v���/w���Vor���ՉY��]z�H��uD��5��9#8L�=���2��Ԍ�=��2B��Ǉ}>��9�/�V?���u���T=S?�zݡG���>�Dr���B3�9�Q�"2�M�@)��-��n������c{�=?���
�e��y��)�E:�嚧�X��#��n�Z�ZK]�sA-�E�;�o�,p��R�o�u{�$6��s@��AP#HF�IA]���#��sJ�Ӽ �jc��X�6�c���߂���ݯ6���F��,��=��r�"9@*�@�(I��U�i�������-h�7�#8i�7������1� i.(�,|=YI\���<*��H��96��?}״)�R��|��q�w+�U{�J�����d�pѲ��,��'�q���	wTב.�J|xnZ}���;��տ�[���6WNu�3X��k���J�|Y�$:84Q�t�*Pj�"����q����&"�K��>ؿ���@O���ԯ����
"�"��p�diIAf+�u,���h�&m�8�5�*��o/t�$Aq��Fgm1D<�Xh@7�(�$u&�% 틧�zZ�ʡS�P_7���2���W�a&�h�x����D 6�Dt� z�,��.z�o�-��̍��GP�)�R�~�#�t�,]�ݴ��r�v�u���C�G$!��s���pR����$��Gi�cF���-H��Po���y�!wMϛ���̧_�.��i��q�(��s���	�]fJ8ҍP/C�����q2��X������y��*�׶���3\���ú-���y�O6�!sQ\�£1�y
�J�B.�b$�N �>�[���l_l�n�F��4�X�~fҗ�xl���oK����")� q�(G�S�X���.��/d�r�ǹ�*w1�6�$m��n�lE&?=�mO�v���@���5%�#-��B@U�$h���,��8;΂wq�K�DB��8�D�}<�,?�@��<k��B�:O��]�hKݒ���r6�p�w�K�_ޭށB��}%�`Ч��s��By!��HxNz)�C��-�%e���A�ty�ia-QI�k���i��ϱ�M�m>ơ%͟�m���wFY�
:�F�(#�*/"N4��#�H�ǀ����ea?V_��9R��.?��/P������|��!�ֱH�G?bYBY��܃
�@*m�[�|ߞ;gB���xwnJ��C�Y�ͫ���5Caje�����γ�e4)[���:D��k�x�u�n�C�C̵fQT�d(�J�D3�֙�6f�p��.���o�iӔ�"�?�7g������&�D���Ĩ�j
�d��$T�ur `y��9Ǎ���)��-���y�s��e;����=���$ ^j���*O8�l�"�exj��^��=@�`��Æ�gy���[*4R����jPﺐ�i!ZI���%�%�%I�����I���5�)J��C���h�#4S$)�*M\�F��n��f�A:4���?δ����aQj��$zIі V�Ȓ]�k�5��
�mU�C����S�q��?.�A�$C������84$~��C�ۥ�ĝU�K�3=>l|:��M^o�GWf#�}�g{��{6_��=z�����B!�L���Ө6�\	K9Z��nLMo|�ݓ��_���=H��%�!���	�!�Ȩ2MɄ�u-���W�v������Q�?=ϛ�t�c��:�1��r".W��EE�yabi�����4XF����.��]F���fG����%�JK�<�9�d�uSh�Z����B/����u��l����a���s�ũڀ4��䣅7":�dE阈��AB�ϛ���.�������/4�`hB��T�<�Ð���:�FW2�1����,�#�?�S���j0�f۔v�|�C�g����?F��!MIYCG��+A��+�K�3��|�_Z����U{8��cY��S�4�7]�e��7Z�pO�ՙ@�AY:*	BVfUZ�E���Da�n�ڟGڧ�
'W'r�K�����9�v���e+T�1T�k�|���@�rk-��-�d�oZ9�Ŀ;�����Z��6�+�͍Y׍��=H�MfU�$���'�PA���8K�
�.���h{�?t�aUG�>ϣ�ѱ���$��E�]�^\`p������wi�I�Tr�����Y��"�6t@�8��	��WAv>'��F��*.M���!R$:�I�j�e|�d�S۱���o�Ml�xt��n2o�A��������Y�($��:b=:�e1�8�z���j&�X���W���u�����A�;��j��.u�8���R�l��I!H����
�	�ks�	�E������y�vݡGi�,RpF��4��
�D��ba��0�SBq5�fy��uZN�x�����$��emNy�SJ@��'>����K���!Z�0��0Tv2�z�7}�+A^��>i�7)���G�G#�������:d��� ��a�'*��2�\}݁8j����A0~��N�@���M�[��b�c��2#� �k�m��
W0�?:�1��l��pq�ԣ8>� �:(=���߰�O�b�)Ո�"I��$������.�9G�j9VA�@7�k7mh�!!Gm����?��Vm�b�r��@������9Q&(3h������'̄�ӥ��)-���;D�b�=9���&<�H��,$�]��5�\W78qs6;�9�6���x.�N�$�4�RH��$1
p@��<�I!/=�0����c=���Z�a�n�v�ϝ�^���K����-E�?-(
~2�$27�u�8>b�=ׁ�%�o�V?����ͦ��q���	F[SD�A$R_y�N�S4�QQ������C��8vy��v�����$X	���P�4/Y�PbZ�c���e��k�k�Ҧ��7�S8ͳҍ8���%Wv�ĳ��.�RK������Y�zE���_�;��C�u�1�����y�r�;�_I�'�`lј"1� ���N@LV���v1��d@�=�=6����C{84�>�*��=�l8u������(��&���Ժ�K��'������m@c�8��g���)y^��J9j�Z��kl�G�B����qY&���(]_��x�6;ߛ��<
|�]<�$���&�*�¨M�����������e�X,���#e8������C���e���HG/��B�&�1��zNWi��=��-�VNM.N�m���s�0V�|A����:N������C�=L)�(pB%r2��"m3Ej�0������#�o�k�ۨ˄��^F>/?�Ճ�PD\}��!>��F�!�R��b��.C'W��W�6fd�.y�������s�E�T�l5�/��M눚JEǂ����҈H�Du�·-R���u������M��Y9�c�j�(gka�Eё
aZp@�<,LN^L��������>�K����n|7��+��LDY�3P茔:Z�ѫ=bI\֣���C���>8��fO�Yۭ&9��=ʒ _�Z��"`9
A5Ꮡf���T�nͬ�A���D�k���Ltl����-᷾��E�����Y������S8�I戼�P!6�9wT҉�x�ɱ���G� ���K�_l� �  �8�뇰Ú� \�\A�4��	��׻n�����)=(��Nې������l���u�A��č��������34.���b饻dƪI�|���!���IU���O<�d���5ԛ��Y#����8V4
�r%G��sf�S�t���'���=R�A����X�Ғ@#RFx`I��Nm��O�;�Cz/z�sO�n�o3��C�%P=u�e���CYP�5ФK3$�t.&�c��C\�������=�ρ�g��.��/T;�抬�#B��$If	�},yɭ)D�,�c}-v��3Χ0���z�*]&�9!<=�&g�XvI.u#�d��ì�������s'�Oq�1�g,��%"�I��
4�����R>��7u���l��h����ͭK���q���g�סL��>��&�9��R�*[��RN�����逮Yo����u���M{A�n����dVZEO�,�Y��e`����R�y��2�.]�������Sx!d��%�pA���N�p�Fd�2<���^�m���c�]��I�>6:��Q�����@��yv	�&[�.�"N����(��12,�}}��7���N�~ֆ����͖@�L��b�!���$���o�/�
��]ճ ^�_�2�[y��>�IUo�z�:��9�����b�Un�憗�1'~
�����	�I�|m��d��:�z��@>�(8w�G��F>�x����Y�ˢ�qJ�H����E	��(��r(�����)�v�GO���}�?|nwo໮���
��"@r�H�{���AJ�&�t��}������Oޔ<�3,�{�4�8��Z^@v܋��=�`��K�8">y���~�ؠ����?�9�qu�zU�^_ߴϻ��=XQ�FJz���$h!I����A-c��)�Aw2������]>&p�����?�m��^��_7���hE���P�xH"�IUH�(�TA�ybzA>���ޭ~�<?������ƣ�'���ȅ�d$"��@�З�X�U)��%��>�+>T��]�����{}|��ϫ��v9FQӎWg0<�!�JP�b�*_)e�D��H��z-y�?��Z0��o|�].�7�~�  }�;X�� e}�Zx\�M�X�����68�1C>�t���
�(x��"j	d��Է�RA .��T�V�F:�F}z�r��VQMU�Xt�J@��Ctu�#���g�����X4O�􆌜?�X���"E�@L�"ϰ��^��\�K�\hw.��h��^B��'GW�ϋ�y�U���]cBrF�!�ޞ'��ឋ ޗ��Q���i�<��e���M���{X�I��F}���������P1��"�Dfz:���M�{��>���}�ɧ��e�<�{������/�`߸      �      x������ � �            x������ � �      �      x��\KsG�>�E�,E��z?�Ѣ=��������C=�6� )81��{��G�7�O�lVu�	
�h����&��2��2�ʨ�vE�R�D��(&�;���N�׫���|���_����8��7��"~��X|�0&���IZv޶o������}ٯW��_��
~��N���Ϻ�{�~=_��9��6�������C���fxBsG����������]�����^��}2[�������_���WL9ǓHb����Ē@NX&IL.\?.l븜�2"��~��
=����e�Õ��\�k�s@�ps_���ў��Iۧͣ�Z;����!�����F�R�ESP�
��"ML@�d���)V?���ȝg��١�,�VVa��(�D��,y����++v(���f��S�������4E����b��_W���������y{چ�7��UVq.i�)�,R*klEL����t��r��NBg����"Ĺ�Py0�"��H����e;���_�Y��.�G����5�8I�E2�x�
f�F�|��z����}�߿+ڞ-;�U��fi����U?my��I;��.^]���Ƀ�^2��L	��"���b�[F(�Nԫ��}���Xv_��|�͆f]����4LYI���ygE��fc��f�����*.�bv��q�e�'����;RM��X�z�]�z~D�)���?�;;���Ylˀ�iۗvaa<�/FƉ�z�8 g��ykҁpL��8�/�m�[��%|oX���eo��<�v/��XSd�Q�'0�8���=`G�e�ta����
;Z%�TD��pFR2@>1�����Mv�I����rr���՞��Wկ��@�| �ܑu}�.���_r0���s\�����))���(�`a�0l�-�������R�by���D���[!��0�{�Y��SKU U�f,�(x�y���x��ng��ֹ]\�������A�H5����M��'�����:�@������x�ob��%�t������WOΞ�?�<}�mK)���_6{�ʏ�(t��N`��l�	��T�&`����@kcL�M�yD'v���#4�6�D���
�e=�����+��KG--Qa��F�� <,BA��0Y�	��d2*����aَ�;��lˊ��A��u����1�H6�r����`������5��C^��ǨQ���H�F�Ȍ	��C�c�;�����j ����w^�9.�T�-�9��#�cBı �&���਒K��G{��@�.}͠d��.;� /���0��g���μ� ga-NPp��:�1�{U��v����'�e��v��"�������.���u���c�\�U�K�~��D��w�)�`0��/`K\�𨊥�,�{.%X<�c(p�B�M�)����@��x|��x����~
���,P�M\^�'�߭����k@�%��w�k�ԃ3@NFH
H=q4!�E��@�<������^�8�ח��!�qqѯ]��U?wqV->zB3�3���:ř�I(�K�#�E�421%/hN��G�nL��oف5��7�z�6wĚA�<������mk��+l��QT#!b~�,���4�aOV��>��O�]����n1hI�����:0��
 �(g����p��ԕ� ��I� H4����@x�YU�S�Ɂ�)t\(�2rA�@�	���u,��x���:7�0�ݻ�'��:�Y��^R$�Ĝ�"n`J�r\X#�[��v���&��v&ۺ��6RB��eH�$�M ӣ�)%c�9wY�u{��zM��` "I+�B~�"���Q*�G��!QaC�e�m/�֊�h!tR���O�J�x`3�0Ň]C�����/S�R+#> ͬ@X �Ę��
 O��4}��;����������iܿ0�1�BL:��e�N J@�\�Z�_�.���)~R"����k����<�;�={uVi���2K�`�:pI�LҘ��un�>��Mv���p��ߥxΒ��R���U�Z���F��)u���]h�̜��R�p���VS1���`�C���czp��R僵*�z �*r]���+�h�J��\K� ��Y湲{�H��9�/��ۧT�+�r�	��Z
DR"(����&�b��k;������v٭�y̋9����7�hyr�u��hk%f(FB��y>�!��T�J���P@�G<C�=Y���î�A�`�^c�9#y����ѕ���y�L6�1������o���W�k%��$��jѵLe�r�"�h<	�+g�!�p��4�!��� �^�J��I�`(%��37����~=�	�Q�ɉ���
q)K&�	ʭ��s_	��'72�i?s��<���J�|�i���q�;��[�1��(PN����"���	�L ��I[Ϩ�v��I�m)���O-��yM%��2ڭ,�ς�p��J�b���	3
�7ZDT�Sp�60�!��v���}q<9��]~�Z���������#Ob�E!!��� �ض���z7��<���Wm,��cy��"�!F��	��$=���(D��Pz;����[4q�Ζ�|���{+a�k��g�l=��3�ń"�����	;����ճP�;!��X8. /�R�ف�q#����F0�S&0 �#2�h�����zWo��$N֗������{��E-L#P�&��_4q
n��4���%.��}�/K}����U$fh����A��4a���;�&���.������߳�-gY�$���S����E�����o�/��)Ĕ�����.���?H��@��a���3�2@ǎ���2�1�0��	�Q���,������lO�ʝ�H5E���ꪛ���W��T
XBԀ�JT�m9ń��SOteN铓f����0 �1
R)��ƹ��������2Z�)�1����M]��x�!�p6�⹫07RW=�vt�q½��~cw���*'��F*�7O���k����NFg���hA*��N���&):z [7��N��w�R˱* �O
Qg4�Bk���p����zRcve����L��A$��I"N�@���!,2{@þ�I}fLBJ	�'9=�	!>Gp�s@E!|:
�3)P��$��,]�+50�umoJ��ޯ��-r]�Pq
H��1�D�����i��i�Z���hc��"�DR%^8s�:g���A��; /�=ze͎"�ͭ���ֵoF8;����3�̷�c�U�c�����t�=�@2�e ��0�
�3��qg�!��Q�~tLvaC������`�՘Y�������ji��2�`�@l�q7И0�Xܴ^��p�s���U�h�ۯ�����qY���>���M��-�����>�Uߖ���~�c{�4
`� 	�t0� c�䱺��f[ϋa�����T��w7��c�xRl�
 �?"��y�د��BRB-rD�6���t��i���T<�w%�>#d�wb�w�.�J^��}�M��8t��X����9\��[��w�H��#qL���n谥`�=�)B�5��x�x��J��})2�;bMD��3)>d��YuK�1��z���n8��^`؂1�nl��t��67� 5� `��%I���NV��!Bd��.]u�cx;R��%e�S���`�e0�Alh�8�V���Ӽc'�����ُ�/v�]a���r-E*�����?Rf���,3�{��硛'��)�ރ�`����䇿��>��U�y(n>?�i�~|\1	|=�	qYn�c�E=oN
��Xr�v��=����U��/r-檝���Bُ�N�W�5h�7sqM����Ѹ�g�|�㏏���M�qվ�.q���ݳ�k���
Y12�X�eLȳ��$+{��m���hrm{v�����gݴ_�}�˰6���m����a��G�=�®���8��e���w;����+������:���U�^�a�H�X�*v8��c ;(����(Kb����8���k�y� �  J1���+b���mt@�2�� F��H�JA��70���9��X�<�7�I;�ӚZ燲� 	�hq1�(��! #>9{�|�A���^=���~6���7�w� n�ۉ��yQ�q�y��j�k��^�����]d�IOU���ۆ-5��-(��47�)�e�)C����l��&p���4�b+ev��P�@�N	X��n�d��K;=ʃ�Y�m{�]���ǳ~ޕ�ݸF��kH���2�u����|v���Ӆ�	�}��U����3��iM��-��{3
�.V�O��� �u����^����Q���#���a��w�R�^А�� �;�N!s����T�]���l�v�/�S|-b�F����=J�<v�8�G���v�´�`���"�R������ v����=g�756S���#��+;p;𞳯���<�%�..�q?�)1�}nL��W@सV87II�����G�	a�(��;����t��s�ͺ��� �u;���<|��+mH)���V���X b��Nh!�6��n܊���nѭ�K�o�x4>=to*T�8�M�U��?8�9
J��p�\��O޸�f2t���Wp���f�f��4�]*�� �L	Y�)5��
�MtҨ��&#����V���|۷�r����O�*�P�ܭN�$ʐ�4"k�C��P�-��cZ�.I�1?.������ªj6=�H��	�}�,�E�zd�2�ɂ�67�i�Q����'j�E��G�4rrЌ�8���s\O>����?M��U�\�P.�cy�9f��N������?��'�k���iE/O]+���aV�<����ߨ,��)�Dx}��۱�]�;�����<L|��2�Fb<�	.mT��lras=�x���-O��T;Ľc�%��H0�I���A� ��]8:χ�,.���q�ؔ;Ǔ/6aTh�1b�H+�۪�Bƅ��2�[J0;����p��s��6�2gK������Y�B`�u�_��]�k"��詼��K���x�B����t��ߞ9��/�����sv�[�l�f�(CG���j��?t�d #��.�c�(�tE�h��;�px�\�c^��
��no�Qb��6��w�xsrW)�����βO��{��^he�s(��@&Bn�(��@��y8���>h1�ІB�ʅ��uw�zc�.��Ƹ���C��0lݫn0p��KD#K#pme$��� \ћp�h�ƒ��6�kDa�&�b��k[qa�d3�}��f�"G����1������3�抿�Hc�	����ш���D�>�&�R(==ހi<<�T���j�� �8G��,��cD%	.)���z�1�0n�w����Nzc�gH�J

����\�Q��R2��$�N�#�m@A8�5�kd�Q�]2���_soZ��?�%��6#�ƞ{��{�.�]�E8V�+a��,�)�����<շ��G�!�v��d.2�z~�^�8�\������o���i�r��yנ�x�m�8�;����~��W�p���g����i�2�`�#l��S�Ҝ C�1]����'n~�)���#���0>�p��-���E/�J�8�HY@7���W�ίD�|^�zq�؊�?���83���������QS����&M���:X�Hgu� g'�?��v��V��<@�`8�hSB#o��Za��)';�Uܻ��vo���w��ޱ���f��y,�<TN�:���c�"�H+@{΄@"�uB���z���i��-t���Ŷ�=��oVz�J|Di��N:��g`5{��X�`�^ynX}��=�!��s��˵ݛ�*7����L`>6嗚I�R
�Z
摕A� 1 Vk��p�,�����1>��8�r/6g͖��ē���R?�9��B f4謺��Zа�˵SX�D����r��g������ն_ѿ��W����      �   �  x��]�nI=��������3�&���bM�6�h�/U���H��`��h�c~l"Ij�gZU���D�D�����K��v���o��_�~�^�/.�����͗n��n��*R���oOξ��.�z���|�\v��b�J�����W������x���.������dC:��|yĂv4����f�..����[�r�3!YN*B|�����j:�4�|������_s��/.v��s�tĀ�������oq=��n6�j�S)RՈr�@)a�"�޿9>�]����O�v}�{�����ΝU��*�Ē�b��ƪ�p3TR�0�cN��`O�o��r��t���d�`R�	�O�J��@V�
�2���U=��@̢��Q '�##P��KX�MS����L���t�n�mz �I�B�����
����Nެ���>.TԊƱ,lͅ`��0{T� �߹�����L'?O'煉�n���vq�+�X��}T�n���Gf c	a'{P�JҌyo./?�8U9}��,aT�[�a�B�;@��c%S�Q0A(N�A\��]o���eR�ĬV��3�|��϶���&j�`�.Z\9�A9��'m��`�89��(�h�G�8�}�Kȟˋ���@q�7�����]0���nu�m���c=���èg��'-?�K�������)����Q!WO�3�	E�\%�!�t�u�\,��nӇ�e�Z¸�VK
Y`�;����U��j�0.�8�%�J#Ҹ��5nmm��CD��y`$L4'T��\�iHgp
�\�{@!��Y�5/���a�����u��U�P
l�s��� �Y�4FP׊&a�NV��B�	�P+i�H�¶�ڄ����J���` p
���c̅<yB���\���=B6R�b1j�;��e#��G��qjl-h�##2Q���a�3!SN����j0����si�h�b{1Ԛi��o�?��{�$��J$=U������'�M�E��Pm��Amh�v($�0�Z�Z������b���ع���di5C�(��� �1M5.�Z�$=/x:��u��*;y��S9�.]/�%m����B0�ay�ş��b
E���J��9�+jING���ͮ��� �Fb�N�����BB�J�0u'ʥr��sGd�lR�p�V�NP��>ľk÷����A�8s�`,!�X2�����i�C�.T��@�&�6N�*'˥���Sh���P���S�0�8�:u6k���Z�>,&�D�[C��(��3�q �9q�=�V.$�8X��3����ˈ��O35LTð��P ��)@���c[U�*�F�4L�	jvY���{v%#B�>�� G�k��*k��,W���!Ť �h{�1�V4�s���d+�0E��t{��*U�,:p%���Ll,�/�5С	��
+ud1����� ��T�	Ar���)�������FթG��f���dΝ�b�9�s,�u��h�h��	g�:�T�[IvK���њG�"A5s�S�T�Fp���D@��d�'�	.<Kǝ=�K��Զ����#��g�Xr��:���"t�/��^�e�����y�a,�~
CkQD A���4�� r C/2R>7X�� �Xڲ{�r?�s6��ܬWW�շA��i(U�<�<�[FŘ�l�J[�t1yd�e���D�9��*��ڷ�l�X���,�5NkU�`ʡ���'A�%�r(�$�c��C�(ar�X;�]2�q"�Σ�0a��Z���JpD1��!4i���#���.��
J[�i�b������5TDL�Q
�N���Y���P�v�Rc�#O�7T�8�sm�c�1�1����ɱ��E`�\*=S����8<�S�$������>�&��q�NU�$f�<�lภAK`��E���0:(�*%�ԑ�h���,�r�Z�� �g��]w�n�c��
�A�*LB��쳓���ϋn��3Z�FÐ�L�~THF%�C�!�0ek��d�������ŋ��!�      �      x������ � �      �      x������ � �      �      x������ � �      �   .  x��W;n�a����z?z�� S7��v�\?��lEK�#-�(����������������������x};�^��c��K}{�����o������r�}:}&��]�����ޭ���m+�4�j�
W�5K�ih�V�^�z�����d���,4��*�-��K�����Pѥz[��&P:Z]lZ��
��qs��
�Ƹ��Y[j[����Ь�$�-A]Ac��m�Z'7@�<�ݐ�>P𐃎Osk;��q�	�\jX���b��8p�
�+�)���C��]���&�����s�J���֐�/���h�ZlzZrfd[3���c[��نI�������;b M���{�r�y�Vqg����,T�*��#f�I�m�8)�N2*��9z��q��Lx�Bz�2�|�K��Z]|��m��ph��9��In��cAZ��S��9���b�:�����Dp��u�
�jI�T���"�[r|��a�}�Ł,�6\pTU�e��L��5H���<n��48j�5�#!��XHC�3��ɧ٦r�{�⌳�����'�^C�      �      x������ � �      �      x��|�rI��9�+�R)LiX�V_ؒR���6�Rj�E �9��@x�{��S�Ü�6"s��i>��_2O�=6D  ��2R�`�����򞪚�ZZ��fQW��<֬�u΄�|%
)dt�=z����N�������Ncv2��*�?N���U3;o���9�G�isi�v�V�-����nx�ߞ=̶��Q�K1L~̞M�.fa�=���ej��^���lfM;��,����M�h�&���"��${g���|������Q��hq�],����q�8�q�ž�\�.f��;��}��{���qM�ga������J�h#��2�;�b�^�oo�ϣ��%3!r|Q�ȕf2���]oU`	����|y��ⲏ={��so��f�6�U&̷�L�*�'u�ku��na��"^������I۝�:���Y�;��q��㲪
Q���"Ӯ�̕�b�ε�\��Ig��u阖³��jca�\8m����Pg?d�b�^e?Oس��~[���%~��e�Т�-<iJ���Ӥ_��O�Ê��\�{?]?y���������_���/~��_�Ĺ(L!�!\���k���T�2c}�>�*7��U�AE�l��ٳA;䒯I�k�|���/�	�k٢�^}��"��i;�h׿�by��֟�]/.������;/��v���˭�V�B�qW�U����I�P�kۏ�ķ��pիi\?�w�ąm���Wv�OB�?U^
����Ų���Ü����Q�I�^%���|����U��/���O����ゝ�����hӘ6�JY�Rz�a�Uͬ��J�U���v������oN^����������y���Ce��o�E�~�eS��|�X45�OL:����˘-�v�xK
z��N'�϶x�.�,�<��s�i�0S�@o���髵�B�$|"/�U��$I]����վ(�'*�3mKY6ԥ�+S�^���7�dO��]㖴Őe>���n!����Z�of�z;K�Y[EL��7!S�����%��7�oL���8S&
V	�3؇d���2E�c��[p{c�;mg���z��΂��� �-g�Y�֭W;�g�Y�w�i�]^u�Y�#�'��K�	��ӿ�?y����cS(^���|�F���Z�̲�e�$�i���Kkf0Q�qÚ��v�MY?o:�ƟϦ�?�{����Zb�%+y͙��b<��EWȪ6F����n���v�y�0�%9����2\DQ%���@Sy�*�W1�	!�q_�g�������A��'Y������k:m�E3mlv�XgN歿�%P@8�o
g�+�k��O�=���h�i��ŏ��fE	�f)6I��C�����ȵ6y�)S��1�|ʼQ���W̋"��܉|����2	r�|~���EaNi.(�/����r@�����a
����R޺Peʤ|gJ�s�PF�\(�<��!�(]s��/���6�h���A�8��c�jX����S�I�`VP_G�e�r�$�LY%��)J�/�	9�l�QvI�' �HX�����b�Q���G�Pdx:^��$��9/k a\`����zj|�~���m�)�K<({����}���tB�_Xl���F��q���"��Մ�Jr��߲5��q��{����Ճ�٬]�}z�/�%"���5��#J�X��|G{'��y�KN�/���c8�,+]��u��<P�
li-��d�
QT� �)���K�V� ��B6�e�-"k���M`ﱏ�:�������s&Ye��]����>AL�-�d�:�c~g )�Sk[T!ב���5�ł@�A Bz�>$�"E��I>C��ٓ�����T��~Ma:�$�2�&�_V$�YYl����, J js��h"+����AI~@�..�4v��?�޽9_���5��Q��K���ƹ����β~A��9�e �||o{�����7���E>��T	�Z�d�����;z�=V�s]I���>(�M��0'�e�(�j���%����S.PXۇ-ў X @;7�$n�2�O-;��B�u���Uk9���lw����E�ߖ��>����ٹ0<	�k�u�*�P8�iQG&sn�J�_�Rٻ%Ί�,����>�nMFB(�����2u`�D �u,�`�ʭ®دؖR�{VY\���)�`my $r�@@����֢���UV<��Y������A��0����ՃgXx���*��i���%L��w���X�+���j
�B�$ku'l*�J��DpH��ڂz��7q�4:Ƣ,��_)��U�a���؎�5i�������%6h����c �N��"S��Ic+�b��k/��Ƿ�x}�	�=PLS��R���EQhqM����X��Iys���P���J�G��"{pp{bU]��r������U���m���Ͳط�xH�U��h�dE����͙�ਥp�
����+�V�A�Wq	���}���q~v�=�l,h��Y��~�R]m'�wv0����+�P
�u�\�<s�AVi6z���x�����y(K�3U�Ȗ�kf�e������rX�A�76�|���}������Ndr�e69���n�mR�P��-�� 9�)aؒ��CK�8C�����2��� �a�����y��
᫽]�5mG����m��>�¿C�Ύ�_h�7o����ޜ�%��_��s��d�0h��8`T�������E����':3���̧bc~��������
�*��	��@M�L�Z�6�<�� )��:���� �^��]e�.)�kh�_|�O�Q̦����)��A�P�������WKO��rd ��V!!h@������hϭ�Y^�\p_Y]���N��<ё1��k�1�	Ȏ!��U�	~�lf��OX|Z���Y;_� ��L�"��������5������R�J�c�$���<�ǖ��L�r�w��rQ+��Y�9��������� ���N~[�09���AX\ �-��8؊��ױ�b�m�tv��_ vhM�҇T7�i�MBӂT��T�Cu�Ju�.8W ��e�˕%�mC��̽���w�?��C��o/��Z0ޛ!�fh8�m�d����p"�H�	2�o )L�J�**r�gJV��Q����_b�̞�t�|1�Y{5��ˮ���q�|窝^-����h7��H���xM�c�ӛ�l���o��}hUQ�%O1C�����V�1���)�U;�_��2�
 ����􊩂;�{Б�� �ܗ�:P$9�����o���^n�v[Z�+�&Qo$��������^zə���A�#�/!�p�*'P�Wz�ĳ/�W[>ۓv%���5�-ō����	NxWR6�aה'��W
���p��Q�zF�H产WA���6X��˩���Rq`N���bf�G�%�h��X ���+��l�R��f�*[�w���v������$"������}�)��U��b�B~��ڛ��l��Y�f�tB����h(�R����'IVA��8 �Mgng��5��7���M�0��Wu���q�LJz�� y��!��.�����P�#O�5j�7'(�-e ���-"u,eP�^�C����)�{F�o���jy��]\O�cI�_�>z��-���XM�G���	{���ӈ}� p��& ���v�E�h���5S�j?��^��+���*�F�1^T|��o��W �(=w �������@�/&�����}��ӡ��b�'�zo��{��%�b�	Vy�^�w�ΗG�� �/�@��IV�c�\Y�Q��(�4�P5ZqQ2kdi��Y�6}L�g���|��lXyU�+�^�k���'9�|;�Njb����8M�������\mri��'�[�%sl�kkvIg~|8�l��l���DԚ兒,�%U�e�����Y�'���r>]^5�'��'�s������g:��8d��D��J�o��;���?��W`���B՘nEd�$�Q�<L�󜧊�J�}X%��5�A �"�0ۨ����Ys���B �,#_W�@�]3    F<Aߝa�H�[ſ�Κ�AjB@t��,Z�p\�Y�/u���Uhh	���<��.\�n�+��G7�^^6�M[�ta���)m�؄�~���qn�ȽO'/�u)��k����ظ0>c�aq`�����VxL���S�Tc9�N����W��i��>Ȋg��u�˂Х!0����ڿ�y��Ww�_G��$̦�JC�UL�aV�8�<w>��ox�Py�Ǘ`A�r9O^����[XQ��le
��*/�9W��`���}���^1@����y3��&F��_^�!�]�������$E} �� ��8�A�V�rJXy1y�j��]�M�]S�M�y�O�����S�����l}K�gM�]~�]�Y,��H����G޾]"F�&��J�E��f��L:@���2@Z�2UE�T.r[u��'�����ӛu��%�y���Om�����=D�u�=I��]�	0Y&��R����ʎ�T�P*��妨_jͤ��D&/JY��w���\�f��w-ԣi淤���i�)���[s�uM8O��TϾ>�K!(�ߩ!�6j`�u�M��m�*�#�MɄ�՜2�[���3D٣�y2m��G��ɣɃf����c��B,<����N 8�&Ĝ//�-�m�UܤN�T��֕p����4��7�9)"^;�T�@�l��Ն�;�B G� G��ei{	�%��Uh�om-��e9ǧُHJM��ן�� �������}M��p=n�^�_I�-��T��+#N�ڋ�V>�����ӧ�?�|x���w�y���Dêi-uF�M�FR�o�f[��[�4��MY�ɣ�=��`��
�! x��)�=���mPO;kCK� *�>IZ�i�p�zL���s���&��A��&+3j���%S�<2u�9��� ��8�]�M��}��K�1�h{��wq�c (�LI��Kj8�]���z1�ɝ驢X�*�QV=А��.Cn^#n�@�
��\�̇�F/��~Y`GH�b���`ʳ�=V��My�x>%��)R���F�<�ƞ��~/ݔ�`��L/R�4k��E�R��fb�ȁ,��
�qɸr��Xc�L���r݁Y�'1{Ѷ���@VC�`q��/����]C�	�m�^%��A6�M�,��V8R�����\�9�Y�<Ig*T���YX&����`���WE��;�t?Sg��d=Hw�U�9�B�4���)����>m��Qv5A�O���kA}�Z?Y~�̟f�ֆT���*e�וE��(w�J��"^y�w�ڋ�qH���TyJv|�,z|g�w�<֝'���Av��% �����Q���������%��*�ġ��h�������m��wl�y>�����]�j��'?�y뗼�J����y^1e�d�*Ǫ�*�a��F)���Y��H���IN�@;M,a�x5Ir#򮅣v�ÖJ�F������6��Q��h!3�j��LEk�N*�_�e�nk��I��4U R	~K���1��쑰V�|mP���	��#*�&���|Tژ�s_ �pVz�Q��#�G�2ue�:��-\g�Z����EXy�_�Vii� 8�J���q�4;��?�끉��G *��T���N
�I2�<p�l�EqD?y��]��,.��]Kݭ���.KB�)_���5�4�g� ��(V��g���r�m�uFb�A��Q��$�ٸ�����ƞ���1�����j�Gn'#wJ8�c%��x�z<U��O������=���l||��=�O��ǳ��\E�\W�
�N���T^�]�\�}�)#f'� ��H�����}69ٌDnN���d�c��[ ç�7�u��F�cb���%�J�h�E\�֖��q�\:�s��޵6��z��fq��<"9B�Q<�0#KkeE,�S�� X�&���.�=_�U�����`~�k�~��m�����9{�����c�k���Q@�D����yC�;��i����qC��K�� #v�*��=�!�\�쟯�`�K4�0Y�.x�Ft�%��~�\u�(�!�a�b3k��̀��=��Œ܏�E X/�.���<�afҜE��j=��dY =#� JH(�Ţ*�-�͝��V���Y׆���������nѧ![�:�W��vӰ)N'e���EN��U��^����IX�\�Gnj��öI�i׏LT�����-k�P�X��I��1�g/��zr��퇧�>�<�tP�|���lB� ƧSH��|��g����y��5qA��@����f��3�y?�ڊ��J�7c��s�_VU5LV"G��%��³B�d�UA����y��7������yҴ���C:z����[�Z��`C��BTn��0إ ~���042�ө!�rƅ������>^W�j���fe�t+ůuՁ�r�t��nS��)�
!l���I��<"}Yd��2��Ԁ���^��M�m"
�3���ЯN87�L~Oz�}��R�PYA��f�ᜅ�v��E��P�Ca�N�#c�~^�r���£�
Yi0v	�:l5�ك޺�冲֌�m\�k�u󗕿�~~�Y�c�!>ȁ���3����������HM+�`��re��EΔsPV�W��V�|?���iԒͿ����ב�^R��W_�v���::L0X���h���+�}q��ZT������^)� u�䙫�`y]s��:�J�P�����*rߤ"v����dꤋ"���vA��:�����;��n��6&!c�y��g,�U� I�����+�EJ;OzG^l*�=��A�`�����4u�j��րr��r@ޣ;����U_)l%�p�bwoC^U����V1��5�pU�4*/�,�N��.^3��e��oz'��&�I��N?�q�c,o���%"Q�����d-�9 4�Pq��]U�'k:�*o}��1��k6ç������J�_}T[�G� Y|�|>����<���1��yus�[��d����v�#/�fR����p���)\QFw����!>��V��6!h����/���V�rv��aĥ�����~{���B�qfaե��ʝpk#�,�P��fl�-��%��3����hޭ:�����q0�*~lM,�gv��qCG)�Se�f;	�!�V�b*���5�]�x�J]�*�#���Sd��W+³�@�:�����_Xv��ɈWwW�Z��;�:�����B������a�Q�M�x�e̀_#==d��j>�C=x�d�88	 4*�*��㢲�������{U������
�*LxCE�/�ݬYm�b�9�<��Ps_i8oi� �\��쯛>�^�k��Z�0���=.��&{s/�%g�"��@b��HkK���V�F�E3!�gAFC'�4hH�	�zн�t��lEU��k�M��3�l�ǚ�d�v��� ����.�|�9M�b<s�ặ��ic�b�X%���;Fs̀/��J���)o�J��~&���X��a��qd�s2���q�-3�,�3�����q�x������EQ*hUiVq_���]2yY3S�Z�\�u=�m/<w[S.�Ԙ}�m;�rC�4<y =��pώ)��8ڨX2��e%���)Kͥ�ޏq_�"T�iX9�N�]+�p��rD��� 54\���C����.�K�+�",ن��ɯ��H�Ϸ�Pt�|G)�Nc��� �	#+�kdbH]r���h��22*��%FwIS��"�.��Z���h#nw�����b�X���p��F�{�W���:*��rL�HQi�Z�h��^:���8��iT���i{�U��¡ASh�G�n�1�? ���ڎ�ji���䯩>.��.��	ǫ��N�[`�j$��ݱu�7��>�sD�*�L��
M�K洪Y^�E�!����k܌jr7�E:����k�o�!<4�&���6�ˇ�NA��o� ��V�|����
�NT:��c@D-[+S��:� J���d]ci��_4�\*���7����E'�ϴ�R�=���{ �S�������_oTz$�%���q�o.��IFMvO
��@ya�:�dٮH;�Y��P���N�V�Ds�+5X�:�H��9ۑ�,�rF�l�(u��Z6j� �  ]��T�'l��l��T��}(�~(�y(Ke��U�DymʀL*A��7�f� ˵�:F[�x���փ��Um�U���m���!Fa!���N��������_�%x�w���³�;漐F�!n[e��t �M	HU�s�
@�=��၏��<�C ��7Ln�m:��bj�t�_�%M[�R:�pqӑ�����@�����JΓ��z�n���$��J�j��`X�W�btS�r$^�K:B��R��k� �K�����o#Y4i<
����:��S.7S��x���/Sޙ`y��N�ޣQ�h���nE-��^��`w���FFog����d#1��H�ק�~��H�z�::��CQ��a�ƙ[+c!w��s�巬^�Wo����U-��KY���*��P�O��v���5�(֊3�����gl�G������]�ˣ���X�]��Q�t+}©�{�~���#�0�
X��R�w�<@;��S������J�95�G�uuONUt�B�f���;�˹�c��յ�tQY8�y����v}�jla������;J__s�ZV{'�!��uRǍ�:;]ο|�q��|��l6ώ��|��ʁ�B�iĕ��VJ�,�!�ŰO�^��__2J�f�Ҧ,�貭��-5�y::�4���8�`�:O��yb�����7�u��X���8�t~E��9�`<���q�+�{�P��|�E�U@�_:ߗr�un8���+�|��9�k�ً��s�ަ��
S�� ʈ�iˊ )p��Su���3���`�{�z厮�@^�i�.1-F�[ߥ�ǜ���A(Y��V"pW	I�>piƾX�A
��y;��lֵ���.�|Ú-�nkghch_��o�RR��y��R%P] �xQ�@��S������U8�.V��:��M\��#dy���Ԃ�gt �S��M���0;ޞ_���}�e�����卣�t��uR��6���`��������������X��E�8�̍�Ť89�\������tuQF��!�VpdUWX�����S�v�%�}��m�aՉ�ՠ77����DgEU�:[���
�} O��,X�g��
d�;0�*��8s4s2�y���_Z:2��oY~Ր/���w+[�&�C�����'I��:���c\_��l��خo���޿�p�c�� Tt1��c�� �B8V�ҕ�0^����i<�Mg�A��C:.2CG�Z��K��a������|�tuS�OE���|�0 ��ʫ`��E�fFϔg������,��`���p�(f�qQ;��j�!KCC���QK>�778ix"�=��W,�]zQ3ʲ���e�d�����W�ҍ��LB(N�� #���x��Rȧ��9�qꚖ�:�,+^�""f\%˚�vH(�*��J����-K��D��F	�NuMm�蛶#0�#ǧS[�X�9��o������ג�             x��\�r�8>#O�Ӗ]�á�+��r���������\ �0	H:V^h7o����Ŷ�_��9�٪���B�� t�hp��i�������\�k���YJBJ�=/p'��8�W<Ō	I��3����<fX������.O�ߟ\�R���������kt��1A�W���u��9^&�Q�f4������qHp��
�����j��������"�iH���8I2 un�#������4.��ZVm�D\otO���U�ޞ\��L���SV�R"0�`v�`�X~�p*H�e�g4�pq�έ��^`DZ�۹y�̖���u��t��"3�t	m�O�eO����� �U
����w|�AW9._�b����"�&jV,����u\�~��E��ӗ���u-7�6:Jr!������r������	���mT|�^r�Ny�PnĒ�eNT����՗Z����So:E�k��
��k"�D���6<W�2����FP��4\���3}��X�/�F8Ƣ7�J���Xc*��8>�
q��`��)"₁p�ޜ�~��d9�*�4;�>@��V�����>9�m�e)t����e�
j�OG;��Ķ�uB��k0I�<Y'ɒ�!��]ACy?~�Si�Kz	�ڴ�TTC�A�Ya|of�>JB��b�G�)7\i5U^����V<�r��Ap��gz+�}V�n֨�wa?>����5����!7���'��èa9�<��K���e^f0��E!g�kJX���~X�RM9�I�U�5{0�$�ܟn�(�̌[�!"`���/�I9[W$��DCyl���Ԃ�.C��l6���H	��.Il�����h��o�����0�qmT(@�4�I�9/r�GA��d8_�$ǰ�46�����1*;��fl�-ҞЃ��<�]��8�߅'	8f`�S\k���aݾRT��g��Y�kPX�5,E~�`N�=�y���[��}qlJ5��!�aBP�&#�߁�2���Y� ��`���DD!p۬�_�F�WO�w<�C�i�C?�0c�*z�|���*=���"�{g������f]9���UNH=7��f�C�Qу��j�V��D�TVp	b
�KP���X-z�3.	��].�����������vPa{����� 8`�h���V���.�+�'��k��?bޥܨ�H��Y���QZsI�(�m�'��h6TǙS�	��@I�fe+�D���s&M�)�0xs�x����Gߟ|�u�{�6*�Xu�=�x a.�F����gؘ�1�q�\!���q|K��Mj�<\wS�2�i�M�j2��>��rg���@_���L���ר�;:���:`Z^�+#-X��4[��$7D��eԵߗZ4�IgOf�2����5�'x���������<�ymT�NQ��7�jG,�g�$9<�x�g��I�0QW�*Jqgwշ��́�/���X,0��S�q�D���$Z=�ţ�zl�v�1!����{�������k���И�eBz��[ɪ��0�b ^2��k ��>Z-U�ts���a��rs�=����J@���q�#Ԩ���3˶�q�B,��&̲��x��8��XԲ�K�e�3u!N[G���T#�I"����1�qFW�^|����I�G�MT�%wS�pW��4-�`6���V�>��5��c�!�̴��-?@g8��)%�&e���{l����}L0AZ_�C0wߕ6��ч$����T./�㟑���@l�h&�7��3�L��4�9���Oɒr0�W�9炀����af_ �B[���\��0.5�_;'��r=�JC��`鳐Ѐ��
��`Л��W�GO��dSk:q�W�պ��ITd<!0���n�A����S�c ����4�}tAx&}Yi=��TK�b�MsFo{����AD����ٝ�������(�	Y��	;�ϻ��N��x�8����� �\��U����J���K.s�2Se���Pz:��ҁ _A7��$��$(:
�T��ɒ�y
s�`�Z����L��B�Ӂ򜱋_��"yP��7��e�����XmOt*Q)���}X���Њ�r�+�� ]�\���~F�zh�D���k��Y�' �"�����<X���1��0M��K�3A��~H(y�BdD	�j jY�g�Ml��bͥ��9?$r���/�q�"���Zr��%�Z��<�H$��*���w�y�c4�_��
QK��m�ޭܠ""+ǟ`�zxtI���6�H���،�)�!����Q�Uu��V�βz�:Ʃ��j�5hԲ�fԦ�4�t��x��?�Y\n��$0�_���c3�D��ܥ�u`�rN� =� &�����ʃ	FV��(�v)p��g���9A�~��瘥t��<��Xg|���H{� �*].�������!���L�\9^��B�4Y������
���9�pe��m�9ߟͫ���P�R�1��>�����e�E��!��Bf��� �ؾ[C���8���E\ZZ�<>��J�7r0�I�����`8�I���_�(oԌ1�Y�)1�n(�`w�$S�t���Oo��9��mT�,O���5���X�4Qo!�<E�d�������ﺁ��y�R\yR��S���92&W��JI��k,�4B��4=�ƶ�IG�;S[n2��\n��xA���Aeq��ѹ4 �rf֬{��%(K����7r=B�ߗ��ǣ%�Y�W&�c�&���F0��JF�0�L��ϩ�:��w�X��`2A�(�U�G�Jq?�����*fI���-�����Q
�vхL���ǋ�%�W{F~�lK����솢͚�0�*�Tj���݂[��O���UGӝʼ�c��E��H�@����϶�H�D�'�>tQ���+'[�J����k�6:�	�4�y󂕮�N�L�$Տ�uMw|���ء�a'ҷ��L�Y�2��0�D��j砥���u��	H-�����w"�rtU�!],S
y�Cy���9�����!���n�XQ�G�AVQ��t����t"�\�5�ņ(4,�o��+o���a�n�,��V��6�l�2�=�u=�y�����g�t �����H4,0j��<����	H�~C�
lב�"�[B2�.��Wc�d����3'�-�PB�b�HydV쇡i����\^�������p;��/c�XB$ԕ�c�#X��-Ԟ�ǭ#���Y0W��J��FLⅨ���/�	z��9Ȫ�r���?q-�M�#b���.H���;���W�P�s0�Aܨ�5\F/�u��ל�Cbx��	����n�n'�@Q�*�!.���z�c�B�ۜփK|�NZ��c׀Q˻&��ufzv9�Ҷ~�� �J�}ӴZ�a趔߷\y],ơ s!��K3,�Jn˂)-�������<��n�l�n/��(9��ִ��zUq+~��9�=PVpD��M��\Y!�����0����΋��I`�O�-xNa`d�LZ���Hx����@���Uw��B�������Hf�g�(/�1e���<��Z�z�n<�Cx�� k�_�x�(�p���5���:_�/��{��rQ-o�v�5�-YUWiƛ�����(������*o��\`���f2�9�Ƒ	Jxk��s���C�Q�@��'ǒ(���rg��dI��f�T5ܬ��
k(�0�/� 9A�s^f�DER��+��<�\r�<^���ݬ�c�J-�ѱg^ /ߤ29x}g�ͿЧ��}/����Ԃ�X�@[s�~���u~j�Ѩ��JOI��f^&g�L���6_�LS�9����B�pO�P� �����:�ǩxa
-�|4ǩL_�<On<.�~߰ζ�}���	ڨ�I� v�mPu��َ+����'*�kb���y����@�1��w*/���W����	ۯ���5����	�I������⻗̮��ѫ�����Z'�5Vr�C���^K�?�����䏣7���b���l|�O���^cVo�����P�|r�y��o��cO�֥�3 �   ן�������e�*�a�u��(\aAg!.��׬���A����~y�V���)�*(�[,+�L-7����v]r�kT�uʭϥ<�Eq?s�G�
@t^*�����i0����Mx��;eVM�<مhz��?���x�J�&,w��\s&���5�h��1���jY��7�իW����            x������ � �     