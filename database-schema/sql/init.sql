CREATE TABLE IF NOT EXISTS character
(
    character_id         SERIAL PRIMARY KEY,
    name                 VARCHAR(255) NOT NULL,
    description          TEXT,
    place_of_birth       VARCHAR(255),
    identity             VARCHAR(255),
    fight_style          VARCHAR(255),
    installation_version VARCHAR(255),
    profile_image        VARCHAR(255),
    r_character_id       INT          NULL REFERENCES character (character_id),
    dialogue_diagrams    JSON,
    is_r                 BOOL,
    r_transfer_token     VARCHAR(255),
    r_transfer_token_image     VARCHAR(255)
);

CREATE INDEX character_id_r_character_id_idx
    ON character (character_id, r_character_id);


CREATE TABLE IF NOT EXISTS character_skill
(
    skill_id             SERIAL PRIMARY KEY,
    name                 VARCHAR(255),
    cover_image          VARCHAR(255),
    logo_image           VARCHAR(255),
    demo_gif             VARCHAR(255),
    combo_key            VARCHAR(255),
    consumption_capacity VARCHAR(255),
    required_points      VARCHAR(255),
    trigger_condition    VARCHAR(255),
    remark               VARCHAR(255),
    character_id         INT REFERENCES character (character_id),
    addition_attack_gif  VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS character_ability
(
    ability_id             SERIAL PRIMARY KEY,
    previous_hp            INT    NOT NULL,
    previous_mp            INT    NOT NULL,
    previous_sp            INT    NOT NULL,
    previous_str           INT    NOT NULL,
    previous_def           INT    NOT NULL,
    previous_agi           INT    NOT NULL,
    previous_hp_increment  FLOAT4 NOT NULL,
    previous_mp_increment  FLOAT4 NOT NULL,
    previous_sp_increment  FLOAT4 NOT NULL,
    previous_str_increment FLOAT4 NOT NULL,
    previous_def_increment FLOAT4 NOT NULL,
    previous_agi_increment FLOAT4 NOT NULL,
    current_hp             INT    NOT NULL,
    current_mp             INT    NOT NULL,
    current_sp             INT    NOT NULL,
    current_str            INT    NOT NULL,
    current_def            INT    NOT NULL,
    current_agi            INT    NOT NULL,
    current_hp_increment   FLOAT4 NOT NULL,
    current_mp_increment   FLOAT4 NOT NULL,
    current_sp_increment   FLOAT4 NOT NULL,
    current_str_increment  FLOAT4 NOT NULL,
    current_def_increment  FLOAT4 NOT NULL,
    current_agi_increment  FLOAT4 NOT NULL,
    character_id           INT REFERENCES character (character_id)
);

CREATE TABLE IF NOT EXISTS weapon
(
    weapon_id   SERIAL PRIMARY KEY,
    name        VARCHAR(255),
    image       VARCHAR(255),
    ingredient  VARCHAR(255),
    demo_url    VARCHAR(255),
    effect      VARCHAR(255),
    hp_consume  VARCHAR(255),
    mp_consume  VARCHAR(255),
    durability  VARCHAR(255),
    description VARCHAR(255),
    type        VARCHAR(255),
    price       INT
);

CREATE TABLE IF NOT EXISTS armor
(
    armor_id      SERIAL PRIMARY KEY,
    name          VARCHAR(255),
    image         VARCHAR(255),
    ingredient    VARCHAR(255),
    hp_increment  INT,
    mp_increment  INT,
    sp_increment  INT,
    str_increment INT,
    def_increment INT,
    agi_increment INT,
    required_hp   INT,
    required_mp   INT,
    required_sp   INT,
    required_str  INT,
    required_def  INT,
    required_agi  INT
);

CREATE TABLE IF NOT EXISTS character_action
(
    character_action_id      SERIAL PRIMARY KEY,
    character_id             INT REFERENCES character (character_id),
    basic_attack_image       VARCHAR(255),
    run_attack_image         VARCHAR(255),
    jump_attack_image        VARCHAR(255),
    run_image                VARCHAR(255),
    roll_image               VARCHAR(255),
    weapon_attack_image      VARCHAR(255),
    weapon_jump_attack_image VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS character_weapon
(
    character_id INT REFERENCES character (character_id),
    weapon_id    INT REFERENCES weapon (weapon_id),
    PRIMARY KEY (character_id, weapon_id)
);

CREATE TABLE IF NOT EXISTS character_armor
(
    character_id INT REFERENCES character (character_id),
    armor_id     INT REFERENCES armor (armor_id),
    PRIMARY KEY (character_id, armor_id)
);