/*****************************************************************************
  FILE           : $Source: /projects/higgs1/SNNS/CVS/SNNS/kernel/sources/kr_io.ph,v $
  SHORTNAME      : kr_io.ph
  SNNS VERSION   : 4.2
 
  PURPOSE        : SNNS-Kernel User Interface File I/O Function Prototypes 
  NOTES          :
 
  AUTHOR         : Niels Mache
  DATE           : 28.05.90
 
  CHANGED BY     : Sven Doering, Michael Vogt
  RCS VERSION    : $Revision: 2.11 $
  LAST CHANGE    : $Date: 1998/02/25 15:26:49 $
 
    Copyright (c) 1990-1995  SNNS Group, IPVR, Univ. Stuttgart, FRG
    Copyright (c) 1996-1998  SNNS Group, WSI, Univ. Tuebingen, FRG
 
******************************************************************************/
#ifndef _KR_IO_DEFINED_
#define  _KR_IO_DEFINED_

/* begin global definition section */

/*  write complete network to disk
*/
krui_err  krio_saveNet( char  *filename, char  *netname );

/*  load network form disk
*/
krui_err krio_loadNet( char  *filename, char  **netname, char  **netfile_version );

/*  loading pattern file from disk
*/
krui_err krio_loadPatterns( char  *filename );

/*  write patterns to disk
*/
krui_err krio_savePatterns( char  *filename );

krui_err  krio_saveResult( char *filename,
                           bool create,
                           int  startpattern,
                           int  endpattern,
                           bool includeinput,
                           bool includeoutput,
			   float *Update_param_array, 
			   int NoOfUpdateParam);



//extern struct TransTable  *transTable;
//extern int transTableSize;



void krio_readTimeDelayDefs(void);

/* end global definition section */

/* begin private definition section */

/*#################################################

GROUP: Local Defines

#################################################*/

#define LIN_MAX      (MAX_LIN_LEN + 1)

#define SITE_DEF     1
#define TYPE_DEF     2
#define DEFAULT_DEF  3
#define UNIT_DEF     4
#define CONNECT_DEF  5
#define SUBNET_DEF   6
#define LAYER_DEF    7


#define EOS	'\0'	/*  End Of String  */


/*#################################################

GROUP: Local Var's

#################################################*/

typedef char   SymbolType[LIN_MAX];

FILE  *file_in;
FILE  *file_out;

bool  is_subnet_info,
	     is_layer_info,
	     units_have_sites;

int   site_name_len,
	     unit_name_len,
	     type_name_len,
	     site_func_len,
	     act_func_len,
	     out_func_len,
	     def_act_func_len,
	     def_out_func_len,
             unit_no_len,
             max_connects_per_line,
             max_subnets_per_line,
             max_layers_per_line,
             pos_no_len,
             subnet_no_len,
             layer_no_len,
             kr_io_NoOfLinks,
             NoOfSiteTypes,
             NoOfUnitTypes,
             NetfileVersion;


char  fmt_shape1 [ LIN_MAX ],
	     fmt_shape2 [ LIN_MAX ],
	     fmt_shape3 [ LIN_MAX ],
	     fmt_shape4 [ LIN_MAX ],
	     fmt_hdr1	[ LIN_MAX ],
	     fmt_hdr2	[ LIN_MAX ],
	     fmt_blank	[ LIN_MAX ];


//int  NoOfTitles;

static const char* resHeader[];
static const char* headers[];
static const char* title[];
static const int NoOfTitles;
/*
void  mstrcat(int __builtin_va_alist);
void  mstrcpy(int __builtin_va_alist);
*/
void  mstrcat(char *va_alist,...);
void  mstrcpy(char *va_alist,...);
char  *krio_getIOVersion(void);
krui_err  krio_writeHeader(char *version, char *net_name);
void krio_cutTrailingZeros(char *string);
char  *krio_repchar(char c, int N);
void  krio_stringLimits(void);
krui_err  krio_fmtShapeing(int choose_me);
krui_err  krio_writeSiteDefinitions(void);
krui_err  krio_writeTypeDefinitions(void);
char  *getTType(int st);
krui_err  krio_writeDefaultDefinitions(void);
krui_err  krio_writeUnitDefinitions(void);
krui_err  krio_writeSourcesAndWeights(void);
krui_err  krio_writeConnectionDefs(void);
krui_err  krio_writeSubnetDefs(void);
krui_err  krio_writeLayerDefs(void);
krui_err  writeXYTransTable(void);
bool  skipComments(void);
bool  skipSpace(void);
bool  comma(void);
bool  get_nl(void);
bool  get_pipe(void);
bool  skip_pipe(void);
bool  get_alpha(void);
bool  getSymbol(char *symbol);
char  *getSection(char *line, int *title_no);
bool  matchHead2(int N);
char  *my_strstr(char *s, char *find);
void  krio_readHeader(char *netfile_version, char *net_name,
			     char *learn_func, char *update_func, char
			     *pruning_func, char *ff_learn_func, int
			     *no_of_units, int *no_of_connect, int
			     *no_of_unitTypes, int *no_of_siteTypes);
int  str_to_Ttype(char *str);
void  krio_readSiteDefinitions(void);
void  krio_readTypeDefinitions(void);
void  krio_readDefaultDefinitions(void);
void  krio_readUnitDefinitions(void);
void  krio_readConnectionDefs(void);
void  krio_readSubnetDefs(void);
void  krio_readLayerDefs(void);
void  readXYTransTable(void);


/* end private definition section */

#endif 


