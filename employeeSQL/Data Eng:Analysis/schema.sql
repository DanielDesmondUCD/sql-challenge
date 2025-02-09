-- Table: public.titles

-- DROP TABLE public.titles;

CREATE TABLE public.titles
(
    emp_no character varying COLLATE pg_catalog."default" NOT NULL,
    title character varying COLLATE pg_catalog."default",
    CONSTRAINT titles_pkey PRIMARY KEY (emp_no),
    CONSTRAINT titles_title_key UNIQUE (title)
)

TABLESPACE pg_default;

-- Table: public.salaries

-- DROP TABLE public.salaries;

CREATE TABLE public.salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;

-- Table: public.employees

-- DROP TABLE public.employees;

CREATE TABLE public.employees
(
    emp_no integer NOT NULL,
    emp_title_id character varying COLLATE pg_catalog."default" NOT NULL,
    birth_date date NOT NULL,
    first_name character varying COLLATE pg_catalog."default" NOT NULL,
    last_name character varying COLLATE pg_catalog."default" NOT NULL,
    gender character varying COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (emp_no, emp_title_id)
)

TABLESPACE pg_default;

ALTER TABLE public.employees
    OWNER to postgres;
ALTER TABLE public.titles
    OWNER to postgres;
	
-- Table: public.dept_manager

-- DROP TABLE public.dept_manager;

CREATE TABLE public.dept_manager
(
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE public.dept_manager
    OWNER to postgres;
	
	-- Table: public.dept_emp

-- DROP TABLE public.dept_emp;

CREATE TABLE public.dept_emp
(
    emp_no integer NOT NULL,
    dept_no character varying COLLATE pg_catalog."default" NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE public.dept_emp
    OWNER to postgres;
	
	-- Table: public.departments

-- DROP TABLE public.departments;

CREATE TABLE public.departments
(
    dept_no character varying COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
)

TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to postgres;