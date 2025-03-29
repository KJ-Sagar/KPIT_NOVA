/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * File: rc_emulation.c
 *
 * Code generated for Simulink model 'rc_emulation'.
 *
 * Model version                  : 1.0
 * Simulink Coder version         : 24.2 (R2024b) 21-Jun-2024
 * C/C++ source code generated on : Mon Mar 17 18:17:59 2025
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: Atmel->AVR
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "rc_emulation.h"
#include "rc_emulation_private.h"
#include "rtwtypes.h"
#include <math.h>

/* Block signals (default storage) */
B_rc_emulation_T rc_emulation_B;

/* Block states (default storage) */
DW_rc_emulation_T rc_emulation_DW;

/* Real-time model */
static RT_MODEL_rc_emulation_T rc_emulation_M_;
RT_MODEL_rc_emulation_T *const rc_emulation_M = &rc_emulation_M_;
real_T rt_roundd_snf(real_T u)
{
  real_T y;
  if (fabs(u) < 4.503599627370496E+15) {
    if (u >= 0.5) {
      y = floor(u + 0.5);
    } else if (u > -0.5) {
      y = u * 0.0;
    } else {
      y = ceil(u - 0.5);
    }
  } else {
    y = u;
  }

  return y;
}

/* Model step function */
void rc_emulation_step(void)
{
  real_T tmp;
  uint8_T tmp_0;

  /* DiscretePulseGenerator: '<Root>/Pulse Generator' */
  rc_emulation_B.PulseGenerator = (rc_emulation_DW.clockTickCounter <
    rc_emulation_P.PulseGenerator_Duty) && (rc_emulation_DW.clockTickCounter >=
    0L) ? rc_emulation_P.PulseGenerator_Amp : 0.0;

  /* DiscretePulseGenerator: '<Root>/Pulse Generator' */
  if (rc_emulation_DW.clockTickCounter >= rc_emulation_P.PulseGenerator_Period -
      1.0) {
    rc_emulation_DW.clockTickCounter = 0L;
  } else {
    rc_emulation_DW.clockTickCounter++;
  }

  /* MATLABSystem: '<Root>/Digital Output' */
  tmp = rt_roundd_snf(rc_emulation_B.PulseGenerator);
  if (tmp < 256.0) {
    if (tmp >= 0.0) {
      tmp_0 = (uint8_T)tmp;
    } else {
      tmp_0 = 0U;
    }
  } else {
    tmp_0 = MAX_uint8_T;
  }

  writeDigitalPin(9, tmp_0);

  /* End of MATLABSystem: '<Root>/Digital Output' */

  /* MATLABSystem: '<Root>/Analog Input' */
  rc_emulation_DW.obj.AnalogInDriverObj.MW_ANALOGIN_HANDLE =
    MW_AnalogIn_GetHandle(58UL);

  /* MATLABSystem: '<Root>/Analog Input' */
  MW_AnalogInSingle_ReadResult
    (rc_emulation_DW.obj.AnalogInDriverObj.MW_ANALOGIN_HANDLE,
     &rc_emulation_B.AnalogInput, MW_ANALOGIN_UINT16);

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   */
  rc_emulation_M->Timing.taskTime0 =
    ((time_T)(++rc_emulation_M->Timing.clockTick0)) *
    rc_emulation_M->Timing.stepSize0;
}

/* Model initialize function */
void rc_emulation_initialize(void)
{
  /* Registration code */
  rtmSetTFinal(rc_emulation_M, 10.0);
  rc_emulation_M->Timing.stepSize0 = 0.5;

  /* External mode info */
  rc_emulation_M->Sizes.checksums[0] = (3090154975U);
  rc_emulation_M->Sizes.checksums[1] = (1963039546U);
  rc_emulation_M->Sizes.checksums[2] = (1136208540U);
  rc_emulation_M->Sizes.checksums[3] = (3245937541U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[3];
    rc_emulation_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(rc_emulation_M->extModeInfo,
      &rc_emulation_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(rc_emulation_M->extModeInfo,
                        rc_emulation_M->Sizes.checksums);
    rteiSetTFinalTicks(rc_emulation_M->extModeInfo, 20);
  }

  /* Start for MATLABSystem: '<Root>/Digital Output' */
  rc_emulation_DW.obj_g.matlabCodegenIsDeleted = false;
  rc_emulation_DW.obj_g.isInitialized = 1L;
  digitalIOSetup(9, 1);
  rc_emulation_DW.obj_g.isSetupComplete = true;

  /* Start for MATLABSystem: '<Root>/Analog Input' */
  rc_emulation_DW.obj.matlabCodegenIsDeleted = false;
  rc_emulation_DW.obj.isInitialized = 1L;
  rc_emulation_DW.obj.AnalogInDriverObj.MW_ANALOGIN_HANDLE =
    MW_AnalogInSingle_Open(58UL);
  rc_emulation_DW.obj.isSetupComplete = true;
}

/* Model terminate function */
void rc_emulation_terminate(void)
{
  /* Terminate for MATLABSystem: '<Root>/Digital Output' */
  if (!rc_emulation_DW.obj_g.matlabCodegenIsDeleted) {
    rc_emulation_DW.obj_g.matlabCodegenIsDeleted = true;
  }

  /* End of Terminate for MATLABSystem: '<Root>/Digital Output' */

  /* Terminate for MATLABSystem: '<Root>/Analog Input' */
  if (!rc_emulation_DW.obj.matlabCodegenIsDeleted) {
    rc_emulation_DW.obj.matlabCodegenIsDeleted = true;
    if ((rc_emulation_DW.obj.isInitialized == 1L) &&
        rc_emulation_DW.obj.isSetupComplete) {
      rc_emulation_DW.obj.AnalogInDriverObj.MW_ANALOGIN_HANDLE =
        MW_AnalogIn_GetHandle(58UL);
      MW_AnalogIn_Close(rc_emulation_DW.obj.AnalogInDriverObj.MW_ANALOGIN_HANDLE);
    }
  }

  /* End of Terminate for MATLABSystem: '<Root>/Analog Input' */
}

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
