/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: rc_emulation_types.h
 *
 * Code generated for Simulink model 'rc_emulation'.
 *
 * Model version                  : 1.0
 * Simulink Coder version         : 24.2 (R2024b) 21-Jun-2024
 * C/C++ source code generated on : Wed Mar 12 11:49:41 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Atmel->AVR
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef rc_emulation_types_h_
#define rc_emulation_types_h_
#include "MW_SVD.h"
#include "rtwtypes.h"

/* Custom Type definition for MATLABSystem: '<Root>/Analog Input' */
#include "MW_SVD.h"
#ifndef struct_tag_pMPPJgn69ckPBhypf3vQzD
#define struct_tag_pMPPJgn69ckPBhypf3vQzD

struct tag_pMPPJgn69ckPBhypf3vQzD
{
  MW_Handle_Type MW_ANALOGIN_HANDLE;
};

#endif                                 /* struct_tag_pMPPJgn69ckPBhypf3vQzD */

#ifndef typedef_e_arduinodriver_ArduinoAnalog_T
#define typedef_e_arduinodriver_ArduinoAnalog_T

typedef struct tag_pMPPJgn69ckPBhypf3vQzD e_arduinodriver_ArduinoAnalog_T;

#endif                             /* typedef_e_arduinodriver_ArduinoAnalog_T */

#ifndef struct_tag_FIY6N64L77TlG9jHBRqBuB
#define struct_tag_FIY6N64L77TlG9jHBRqBuB

struct tag_FIY6N64L77TlG9jHBRqBuB
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  e_arduinodriver_ArduinoAnalog_T AnalogInDriverObj;
};

#endif                                 /* struct_tag_FIY6N64L77TlG9jHBRqBuB */

#ifndef typedef_codertarget_arduinobase_inter_T
#define typedef_codertarget_arduinobase_inter_T

typedef struct tag_FIY6N64L77TlG9jHBRqBuB codertarget_arduinobase_inter_T;

#endif                             /* typedef_codertarget_arduinobase_inter_T */

#ifndef struct_tag_bpMNyLZPCJBeBnOB7xlwFB
#define struct_tag_bpMNyLZPCJBeBnOB7xlwFB

struct tag_bpMNyLZPCJBeBnOB7xlwFB
{
  int16_T __dummy;
};

#endif                                 /* struct_tag_bpMNyLZPCJBeBnOB7xlwFB */

#ifndef typedef_b_arduinodriver_ArduinoDigita_T
#define typedef_b_arduinodriver_ArduinoDigita_T

typedef struct tag_bpMNyLZPCJBeBnOB7xlwFB b_arduinodriver_ArduinoDigita_T;

#endif                             /* typedef_b_arduinodriver_ArduinoDigita_T */

#ifndef struct_tag_ldqgYDWP5Rq6U8J4ptL7cG
#define struct_tag_ldqgYDWP5Rq6U8J4ptL7cG

struct tag_ldqgYDWP5Rq6U8J4ptL7cG
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  b_arduinodriver_ArduinoDigita_T DigitalIODriverObj;
};

#endif                                 /* struct_tag_ldqgYDWP5Rq6U8J4ptL7cG */

#ifndef typedef_codertarget_arduinobase_block_T
#define typedef_codertarget_arduinobase_block_T

typedef struct tag_ldqgYDWP5Rq6U8J4ptL7cG codertarget_arduinobase_block_T;

#endif                             /* typedef_codertarget_arduinobase_block_T */

/* Parameters (default storage) */
typedef struct P_rc_emulation_T_ P_rc_emulation_T;

/* Forward declaration for rtModel */
typedef struct tag_RTM_rc_emulation_T RT_MODEL_rc_emulation_T;

#endif                                 /* rc_emulation_types_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
