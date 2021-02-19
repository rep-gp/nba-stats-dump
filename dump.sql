--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: player_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_stats (
    stat_id integer NOT NULL,
    team_id integer NOT NULL,
    player_id integer NOT NULL,
    season_type integer NOT NULL,
    season integer NOT NULL,
    name character varying(26) NOT NULL,
    team character varying(3) NOT NULL,
    "position" character varying(2),
    started integer NOT NULL,
    global_team_id integer NOT NULL,
    updated character varying(19) NOT NULL,
    games integer NOT NULL,
    fantasy_points numeric(6,1) NOT NULL,
    minutes integer NOT NULL,
    seconds integer NOT NULL,
    field_goals_made numeric(5,1) NOT NULL,
    field_goals_attempted numeric(6,1) NOT NULL,
    field_goals_percentage numeric(5,1) NOT NULL,
    effective_field_goals_percentage numeric(5,1) NOT NULL,
    two_pointers_made numeric(5,1) NOT NULL,
    two_pointers_attempted numeric(6,1) NOT NULL,
    two_pointers_percentage numeric(5,1) NOT NULL,
    three_pointers_made numeric(5,1) NOT NULL,
    three_pointers_attempted numeric(6,1) NOT NULL,
    three_pointers_percentage numeric(5,1) NOT NULL,
    free_throws_made numeric(5,1) NOT NULL,
    free_throws_attempted numeric(5,1) NOT NULL,
    free_throws_percentage numeric(5,1) NOT NULL,
    offensive_rebounds numeric(5,1) NOT NULL,
    defensive_rebounds numeric(5,1) NOT NULL,
    rebounds numeric(6,1) NOT NULL,
    offensive_rebounds_percentage numeric(5,1) NOT NULL,
    defensive_rebounds_percentage numeric(5,1) NOT NULL,
    total_rebounds_percentage numeric(4,1) NOT NULL,
    assists numeric(5,1) NOT NULL,
    steals numeric(5,1) NOT NULL,
    blocked_shots numeric(5,1) NOT NULL,
    turnovers numeric(5,1) NOT NULL,
    personal_fouls numeric(5,1) NOT NULL,
    points numeric(6,1) NOT NULL,
    true_shooting_attempts numeric(6,1) NOT NULL,
    true_shooting_percentage numeric(5,1) NOT NULL,
    player_efficiency_rating numeric(5,1) NOT NULL,
    assists_percentage numeric(4,1) NOT NULL,
    steals_percentage numeric(4,1) NOT NULL,
    blocks_percentage numeric(4,1) NOT NULL,
    turn_overs_percentage numeric(4,1) NOT NULL,
    usage_rate_percentage numeric(4,1) NOT NULL,
    fantasy_points_fan_duel numeric(6,1) NOT NULL,
    fantasy_points_draft_kings numeric(6,1) NOT NULL,
    fantasy_points_yahoo numeric(6,1) NOT NULL,
    plus_minus numeric(6,1) NOT NULL,
    double_doubles numeric(4,1) NOT NULL,
    triple_doubles numeric(4,1) NOT NULL,
    fantasy_points_fantasy_draft numeric(6,1) NOT NULL,
    is_closed character varying(5) NOT NULL,
    lineup_confirmed character varying(30),
    lineup_status character varying(9) NOT NULL
);


ALTER TABLE public.player_stats OWNER TO postgres;

--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    sports_data_id character varying(30),
    status character varying(6) NOT NULL,
    team_id integer NOT NULL,
    team character varying(3) NOT NULL,
    jersey integer,
    position_category character varying(1) NOT NULL,
    "position" character varying(2) NOT NULL,
    first_name character varying(12) NOT NULL,
    last_name character varying(20) NOT NULL,
    height integer NOT NULL,
    weight integer NOT NULL,
    birth_date character varying(19),
    birth_city character varying(21),
    birth_state character varying(22),
    birth_country character varying(6),
    high_school character varying(30),
    college character varying(25),
    salary integer,
    photo_url character varying(92) NOT NULL,
    experience integer NOT NULL,
    sport_radar_player_id character varying(36),
    rotoworld_player_id integer,
    roto_wire_player_id integer,
    fantasy_alarm_player_id integer,
    stats_player_id integer NOT NULL,
    sports_direct_player_id integer,
    xml_team_player_id integer,
    injury_status character varying(9) NOT NULL,
    injury_body_part character varying(9) NOT NULL,
    injury_start_date character varying(19),
    injury_notes character varying(9) NOT NULL,
    fan_duel_player_id integer NOT NULL,
    draft_kings_player_id integer NOT NULL,
    yahoo_player_id integer NOT NULL,
    fan_duel_name character varying(24) NOT NULL,
    draft_kings_name character varying(24) NOT NULL,
    yahoo_name character varying(24) NOT NULL,
    depth_chart_position character varying(2),
    depth_chart_order integer,
    global_team_id integer NOT NULL,
    fantasy_draft_name character varying(24) NOT NULL,
    fantasy_draft_player_id integer NOT NULL,
    usa_today_player_id integer,
    usa_today_headshot_url character varying(54),
    usa_today_headshot_no_background_url character varying(54),
    usa_today_headshot_updated character varying(19),
    usa_today_headshot_no_background_updated character varying(19),
    nba_dot_com_player_id integer NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: team_stats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_stats (
    stat_id integer NOT NULL,
    team_id integer NOT NULL,
    season_type bit(1) NOT NULL,
    season integer NOT NULL,
    name character varying(22) NOT NULL,
    team character varying(3) NOT NULL,
    wins integer NOT NULL,
    losses integer NOT NULL,
    opponent_position character varying(30),
    possessions numeric(7,1) NOT NULL,
    global_team_id integer NOT NULL,
    updated character varying(19) NOT NULL,
    games integer NOT NULL,
    fantasy_points numeric(7,1) NOT NULL,
    minutes integer NOT NULL,
    seconds integer NOT NULL,
    field_goals_made numeric(6,1) NOT NULL,
    field_goals_attempted numeric(7,1) NOT NULL,
    field_goals_percentage numeric(4,1) NOT NULL,
    effective_field_goals_percentage numeric(4,1) NOT NULL,
    two_pointers_made numeric(6,1) NOT NULL,
    two_pointers_attempted numeric(6,1) NOT NULL,
    two_pointers_percentage numeric(4,1) NOT NULL,
    three_pointers_made numeric(6,1) NOT NULL,
    three_pointers_attempted numeric(6,1) NOT NULL,
    three_pointers_percentage numeric(4,1) NOT NULL,
    free_throws_made numeric(6,1) NOT NULL,
    free_throws_attempted numeric(6,1) NOT NULL,
    free_throws_percentage numeric(5,1) NOT NULL,
    offensive_rebounds numeric(6,1) NOT NULL,
    defensive_rebounds numeric(6,1) NOT NULL,
    rebounds numeric(6,1) NOT NULL,
    offensive_rebounds_percentage character varying(30),
    defensive_rebounds_percentage character varying(30),
    total_rebounds_percentage character varying(30),
    assists numeric(6,1) NOT NULL,
    steals numeric(6,1) NOT NULL,
    blocked_shots numeric(5,1) NOT NULL,
    turnovers numeric(6,1) NOT NULL,
    personal_fouls numeric(6,1) NOT NULL,
    points numeric(7,1) NOT NULL,
    true_shooting_attempts numeric(7,1) NOT NULL,
    true_shooting_percentage numeric(4,1) NOT NULL,
    player_efficiency_rating character varying(30),
    assists_percentage character varying(30),
    steals_percentage character varying(30),
    blocks_percentage character varying(30),
    turn_overs_percentage character varying(30),
    usage_rate_percentage character varying(30),
    fantasy_points_fan_duel numeric(7,1) NOT NULL,
    fantasy_points_draft_kings numeric(7,1) NOT NULL,
    fantasy_points_yahoo numeric(7,1) NOT NULL,
    plus_minus numeric(7,1) NOT NULL,
    double_doubles numeric(5,1) NOT NULL,
    triple_doubles numeric(4,1) NOT NULL,
    fantasy_points_fantasy_draft numeric(7,1) NOT NULL,
    is_closed character varying(5) NOT NULL,
    lineup_confirmed character varying(30),
    lineup_status character varying(9) NOT NULL,
    opponent_stat_stat_id integer NOT NULL,
    opponent_stat_team_id integer NOT NULL,
    opponent_stat_season_type bit(1) NOT NULL,
    opponent_stat_season integer NOT NULL,
    opponent_stat_name character varying(22) NOT NULL,
    opponent_stat_team character varying(3) NOT NULL,
    opponent_stat_wins integer NOT NULL,
    opponent_stat_losses integer NOT NULL,
    opponent_stat_opponent_position character varying(30),
    opponent_stat_possessions numeric(7,1) NOT NULL,
    opponent_stat_global_team_id integer NOT NULL,
    opponent_stat_updated character varying(19) NOT NULL,
    opponent_stat_games integer NOT NULL,
    opponent_stat_fantasy_points numeric(7,1) NOT NULL,
    opponent_stat_minutes integer NOT NULL,
    opponent_stat_seconds integer NOT NULL,
    opponent_stat_field_goals_made numeric(6,1) NOT NULL,
    opponent_stat_field_goals_attempted numeric(7,1) NOT NULL,
    opponent_stat_field_goals_percentage numeric(4,1) NOT NULL,
    opponent_stat_effective_field_goals_percentage numeric(4,1) NOT NULL,
    opponent_stat_two_pointers_made numeric(6,1) NOT NULL,
    opponent_stat_two_pointers_attempted numeric(6,1) NOT NULL,
    opponent_stat_two_pointers_percentage numeric(4,1) NOT NULL,
    opponent_stat_three_pointers_made numeric(6,1) NOT NULL,
    opponent_stat_three_pointers_attempted numeric(6,1) NOT NULL,
    opponent_stat_three_pointers_percentage numeric(4,1) NOT NULL,
    opponent_stat_free_throws_made numeric(6,1) NOT NULL,
    opponent_stat_free_throws_attempted numeric(6,1) NOT NULL,
    opponent_stat_free_throws_percentage numeric(5,1) NOT NULL,
    opponent_stat_offensive_rebounds numeric(6,1) NOT NULL,
    opponent_stat_defensive_rebounds numeric(6,1) NOT NULL,
    opponent_stat_rebounds numeric(6,1) NOT NULL,
    opponent_stat_offensive_rebounds_percentage character varying(30),
    opponent_stat_defensive_rebounds_percentage character varying(30),
    opponent_stat_total_rebounds_percentage character varying(30),
    opponent_stat_assists numeric(6,1) NOT NULL,
    opponent_stat_steals numeric(6,1) NOT NULL,
    opponent_stat_blocked_shots numeric(5,1) NOT NULL,
    opponent_stat_turnovers numeric(6,1) NOT NULL,
    opponent_stat_personal_fouls numeric(6,1) NOT NULL,
    opponent_stat_points numeric(7,1) NOT NULL,
    opponent_stat_true_shooting_attempts numeric(7,1) NOT NULL,
    opponent_stat_true_shooting_percentage numeric(4,1) NOT NULL,
    opponent_stat_player_efficiency_rating character varying(30),
    opponent_stat_assists_percentage character varying(30),
    opponent_stat_steals_percentage character varying(30),
    opponent_stat_blocks_percentage character varying(30),
    opponent_stat_turn_overs_percentage character varying(30),
    opponent_stat_usage_rate_percentage character varying(30),
    opponent_stat_fantasy_points_fan_duel numeric(7,1) NOT NULL,
    opponent_stat_fantasy_points_draft_kings numeric(7,1) NOT NULL,
    opponent_stat_fantasy_points_yahoo numeric(7,1) NOT NULL,
    opponent_stat_plus_minus numeric(7,1) NOT NULL,
    opponent_stat_double_doubles numeric(5,1) NOT NULL,
    opponent_stat_triple_doubles numeric(4,1) NOT NULL,
    opponent_stat_fantasy_points_fantasy_draft numeric(7,1) NOT NULL,
    opponent_stat_is_closed character varying(5) NOT NULL,
    opponent_stat_lineup_confirmed character varying(30),
    opponent_stat_lineup_status character varying(9) NOT NULL,
    opponent_stat_opponent_stat character varying(30)
);


ALTER TABLE public.team_stats OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    key character varying(3) NOT NULL,
    active character varying(4) NOT NULL,
    city character varying(13) NOT NULL,
    name character varying(13) NOT NULL,
    league_id integer NOT NULL,
    stadium_id integer NOT NULL,
    conference character varying(7) NOT NULL,
    division character varying(9) NOT NULL,
    primary_color character varying(6) NOT NULL,
    secondary_color character varying(6) NOT NULL,
    tertiary_color character varying(6),
    quaternary_color character varying(6),
    wikipedia_logo_url text NOT NULL,
    wikipedia_word_mark_url text,
    global_team_id integer NOT NULL,
    nba_dot_com_team_id integer NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams mytable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT mytable_pkey PRIMARY KEY (team_id);


--
-- Name: player_stats player_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT player_stats_pkey PRIMARY KEY (stat_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: team_stats team_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_stats
    ADD CONSTRAINT team_stats_pkey PRIMARY KEY (stat_id);


--
-- Name: player_stats player_stats_players_player_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT player_stats_players_player_id_fk FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- Name: player_stats player_stats_teams_team_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_stats
    ADD CONSTRAINT player_stats_teams_team_id_fk FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- Name: players players_teams_team_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_teams_team_id_fk FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- Name: team_stats team_stats_teams_team_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_stats
    ADD CONSTRAINT team_stats_teams_team_id_fk FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--
