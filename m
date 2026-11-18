Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992167;
	b=WTSbf/7JzxU5e6lWu4iiKuDtpA5rewiRIz7HTVkcPea2cwnyFNDveAl4gMWHswgK4Xi+
	 HHRb+iqBAS6jImzti4CA5UgYgk0ceu4a9c0PLI+mrP+7zXPwHaFdylPb5oemUG9lK+4Es
	 vbMP7W/9TBYiX3sxjbzoJGdND/7BgQDm/0thvFQLkTezb9cKiFgxmH5ihSreI/vYHaxKy
	 mPULf7Nb8fVn4E6OEKjnYmkF0mRtoIoViirt7vtHCgVpZLkxSjrMWo+WfknNelL11V/BJ
	 jUuCq0YD+7/3POpq0a3JJ5cu+XtV2yuEB1YOXmnKXiKUf+OR8heCs/Tx0CQNX8aoW1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992167;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=Ezzqnf/qyNqG2M+KCCOZ0Fv2CON6vIiwdTqMA5W9SSc=;
	b=1Cx2PtMFEo4tYvlK2Sss5SM6hsTtyZT7JteR4jCgxAdgcWAzSzprKguvfE/3HyQdS1FN
	 FuWYiLJPPs2E8YcInNTcqFjUshelhj6MG/1UX+yU+BEknCgpSVUY1Qn5+GaeYtMJebTsk
	 PtyjIIzmusdARvDJBjsE6MUk6tgfKnGp0aRf5rXAYl9vNc0M/kfYNQQo5z5E83t7m0M+6
	 4Oa1oE2fviS6bPM1nU+tF1hWK2SivTEeC2KQ1q1F9UE2s2cTIabLk22ih80Rn1oj8IwBZ
	 U1nrvn5drxYQSeXA42tsT4pt8AEtdXU3nSHOnNHfA9bkJH3mIdOhIp7CVdf+sKpOuiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Li9Z05hh;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C8C606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C8C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Li9Z05hh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992168; x=1826528168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V7v1Wn5XYJFRQPraKdBSere7RzNuRPRb8kp3VJyWnpg=;
  b=Li9Z05hhiBRsL5G0+aVEUV28CHgwwTi/orcwFxcVHE3Os4V/9fBNJLM+
   H0ExdSLnNG8lFDQB57ueAV+xAuTrgvtuenFBHWQbpnPmnh/lvPJx3lOzF
   sYqlTRU2eUbn19YmQ0rZW7oOuuNBfFc6G9Nd0mm6NBFON5JEc7gDsI0dj
   poyjL9rHHR3DNpPWsL0BUXQgEhGPIrOjS2cQsipaXoSU56j1XnXaFiN7C
   KuK0WPIrm3l5IXTMhwA7HXSHB7wzRzVeFB9FtOj1PP9QFNPnhrwLUFzXT
   Q58yX3ctCkSZGTxgizP9XRgO4T9BX3vUlobD0dlPtLEHd+99WENfW3EMq
   A==;
X-CSE-ConnectionGUID: vN2LcUjKQQGu2mSAFYQYPA==
X-CSE-MsgGUID: pIvlpXvcT+25tl3FVMx5jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871957"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871957"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:08 -0800
X-CSE-ConnectionGUID: XtShSo4vSV6/a65ZZik2GA==
X-CSE-MsgGUID: khlfsAchRs2iAI3xOjY11g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000297"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:05 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Subject: [PATCH v2 iwlwifi-next 08/15] wifi: iwlwifi: add PDGC platform config reader
Date: Wed, 18 Nov 2026 10:57:40 +0200
Message-Id: <20261118105612.4d7f17800089.I785df7c50a66018888f8bab9681b42db6a17f9b5@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118085747.3845425-1-miriam.rachel.korenblit@intel.com>
References: <20261118085747.3845425-1-miriam.rachel.korenblit@intel.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Organization: Intel Israel (74) Limited
Content-Transfer-Encoding: 8bit

From: Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>

Add a helper to read the PDGC (Platform and Device General
Configuration) table from BIOS.

Upcoming FSEQ handling will call this helper to select the correct
external FSEQ image on supported devices.

Signed-off-by: Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>

Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/fw/acpi.c  | 29 ++++++++++++++
 drivers/net/wireless/intel/iwlwifi/fw/acpi.h  | 12 ++++++
 .../wireless/intel/iwlwifi/fw/regulatory.c    | 10 +++++
 .../wireless/intel/iwlwifi/fw/regulatory.h    |  2 +
 drivers/net/wireless/intel/iwlwifi/fw/uefi.c  | 38 +++++++++++++++----
 drivers/net/wireless/intel/iwlwifi/fw/uefi.h  | 18 +++++++++
 6 files changed, 101 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/fw/acpi.c b/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
index a1184da82b11..cad7dd303e93 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
@@ -1301,6 +1301,35 @@ void iwl_acpi_get_guid_lock_status(struct iwl_trans *trans)
 	kfree(data);
 }
 
+int iwl_acpi_get_pdgc(struct iwl_trans *trans, u32 *value)
+{
+	union acpi_object *wifi_pkg, *data __free(kfree);
+	int tbl_rev;
+
+	data = iwl_acpi_get_object(trans->dev, ACPI_PDGC_METHOD);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	wifi_pkg = iwl_acpi_get_wifi_pkg(trans->dev, data,
+					 ACPI_PDGC_WIFI_DATA_SIZE, &tbl_rev);
+	if (IS_ERR(wifi_pkg))
+		return PTR_ERR(wifi_pkg);
+
+	if (tbl_rev != ACPI_PDGC_WIFI_DATA_REV) {
+		IWL_DEBUG_RADIO(trans, "Unsupported ACPI PDGC revision:%d\n",
+				tbl_rev);
+		return -ENOENT;
+	}
+
+	if (wifi_pkg->package.elements[1].type != ACPI_TYPE_INTEGER)
+		return -EINVAL;
+
+	*value = wifi_pkg->package.elements[1].integer.value &
+		 IWL_PDGC_REV0_PLATFORM_CONFIG_MASK;
+	IWL_DEBUG_RADIO(trans, "Loaded PDGC config from ACPI: 0x%x\n", *value);
+	return 0;
+}
+
 int iwl_acpi_get_wbem(struct iwl_fw_runtime *fwrt, u32 *value)
 {
 	union acpi_object *wifi_pkg, *data;
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/acpi.h b/drivers/net/wireless/intel/iwlwifi/fw/acpi.h
index c7c474555868..03949fff32ec 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/acpi.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/acpi.h
@@ -26,6 +26,7 @@
 #define ACPI_GLAI_METHOD	"GLAI"
 #define ACPI_WBEM_METHOD	"WBEM"
 #define ACPI_DSBR_METHOD	"DSBR"
+#define ACPI_PDGC_METHOD	"PDGC"
 
 #define ACPI_WIFI_DOMAIN	(0x07)
 
@@ -86,6 +87,10 @@
 #define ACPI_DSBR_WIFI_DATA_SIZE	2
 #define ACPI_DSBR_WIFI_DATA_REV		1
 
+/* One element for domain type, and one for platform config */
+#define ACPI_PDGC_WIFI_DATA_SIZE	2
+#define ACPI_PDGC_WIFI_DATA_REV		0
+
 /*
  * One element for domain type,
  * and one for the status
@@ -192,6 +197,8 @@ int iwl_acpi_get_phy_filters(struct iwl_fw_runtime *fwrt);
 
 void iwl_acpi_get_guid_lock_status(struct iwl_trans *trans);
 
+int iwl_acpi_get_pdgc(struct iwl_trans *trans, u32 *value);
+
 int iwl_acpi_get_dsm(struct iwl_fw_runtime *fwrt,
 		     enum iwl_dsm_funcs func, u32 *value);
 
@@ -270,6 +277,11 @@ static inline void iwl_acpi_get_guid_lock_status(struct iwl_trans *trans)
 {
 }
 
+static inline int iwl_acpi_get_pdgc(struct iwl_trans *trans, u32 *value)
+{
+	return -ENOENT;
+}
+
 static inline int iwl_acpi_get_dsm(struct iwl_fw_runtime *fwrt,
 				   enum iwl_dsm_funcs func, u32 *value)
 {
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/regulatory.c b/drivers/net/wireless/intel/iwlwifi/fw/regulatory.c
index 01f24db2216b..7acdd2d78564 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/regulatory.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/regulatory.c
@@ -42,6 +42,16 @@ IWL_BIOS_TABLE_LOADER_DATA(eckv, u32);
 IWL_BIOS_TABLE_LOADER_DATA(wbem, u32);
 IWL_BIOS_TABLE_LOADER_DATA(dsbr, u32);
 
+int iwl_bios_get_pdgc(struct iwl_trans *trans, u32 *value)
+{
+	int ret;
+
+	ret = iwl_uefi_get_pdgc(trans, value);
+	if (ret < 0)
+		ret = iwl_acpi_get_pdgc(trans, value);
+
+	return ret;
+}
 
 static const struct dmi_system_id dmi_ppag_approved_list[] = {
 	{ .ident = "HP",
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/regulatory.h b/drivers/net/wireless/intel/iwlwifi/fw/regulatory.h
index 98fcb66f459e..e25f241110fa 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/regulatory.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/regulatory.h
@@ -262,10 +262,12 @@ bool iwl_puncturing_is_allowed_in_bios(u32 puncturing, u16 mcc);
 
 #define IWL_DSBR_FW_MODIFIED_URM_MASK	BIT(8)
 #define IWL_DSBR_PERMANENT_URM_MASK	BIT(9)
+#define IWL_PDGC_REV0_PLATFORM_CONFIG_MASK	BIT(0)
 
 int iwl_bios_get_dsbr(struct iwl_fw_runtime *fwrt, u32 *value);
 int iwl_bios_get_phy_filters(struct iwl_fw_runtime *fwrt);
 void iwl_bios_get_guid_lock_status(struct iwl_trans *trans);
+int iwl_bios_get_pdgc(struct iwl_trans *trans, u32 *value);
 
 static inline void iwl_bios_setup_step(struct iwl_trans *trans,
 				       struct iwl_fw_runtime *fwrt)
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/uefi.c b/drivers/net/wireless/intel/iwlwifi/fw/uefi.c
index 6f08e3b19efc..fa792acfcc81 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/uefi.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/uefi.c
@@ -135,7 +135,7 @@ iwl_uefi_get_variable_guid(struct iwl_trans *trans,
 }
 
 static void *
-iwl_uefi_get_verified_variable_guid(struct iwl_fw_runtime *fwrt,
+iwl_uefi_get_verified_variable_guid(struct iwl_trans *trans,
 				    efi_guid_t *guid,
 				    efi_char16_t *uefi_var_name,
 				    char *var_name,
@@ -146,16 +146,16 @@ iwl_uefi_get_verified_variable_guid(struct iwl_fw_runtime *fwrt,
 	u32 attributes = 0;
 	void *var;
 
-	if (fwrt->trans->uefi_tables_lock_status == UEFI_CNV_GUID_UNLOCKED)
+	if (trans->uefi_tables_lock_status == UEFI_CNV_GUID_UNLOCKED)
 		return ERR_PTR(-EINVAL);
 
 	/* In x86 either GLUI or GLAI should exist */
 	if ((IS_ENABLED(CONFIG_X86) || IS_ENABLED(CONFIG_X86_64) ||
 	     IS_ENABLED(CONFIG_X86_32)) &&
-	    fwrt->trans->uefi_tables_lock_status == UEFI_CNV_GUID_UNKNOWN)
+	    trans->uefi_tables_lock_status == UEFI_CNV_GUID_UNKNOWN)
 		return ERR_PTR(-EINVAL);
 
-	var = iwl_uefi_get_variable_guid(fwrt->trans,
+	var = iwl_uefi_get_variable_guid(trans,
 					 guid,
 					 uefi_var_name, var_name,
 					 expected_size, &var_size,
@@ -163,7 +163,7 @@ iwl_uefi_get_verified_variable_guid(struct iwl_fw_runtime *fwrt,
 	if (IS_ERR(var))
 		return var;
 
-	if (fwrt->trans->uefi_tables_lock_status != UEFI_CNV_GUID_UNKNOWN)
+	if (trans->uefi_tables_lock_status != UEFI_CNV_GUID_UNKNOWN)
 		goto out;
 
 	/*
@@ -200,7 +200,8 @@ iwl_uefi_get_verified_wifi_var(struct iwl_fw_runtime *fwrt,
 			       unsigned int expected_size,
 			       unsigned long *size)
 {
-	return iwl_uefi_get_verified_variable_guid(fwrt, &IWL_EFI_WIFI_GUID,
+	return iwl_uefi_get_verified_variable_guid(fwrt->trans,
+						   &IWL_EFI_WIFI_GUID,
 						   uefi_var_name, var_name,
 						   expected_size, size);
 }
@@ -1080,7 +1081,7 @@ int iwl_uefi_get_eckv(struct iwl_fw_runtime *fwrt, u32 *extl_clk)
 	struct uefi_cnv_var_eckv *data;
 	int ret = 0;
 
-	data = iwl_uefi_get_verified_variable_guid(fwrt,
+	data = iwl_uefi_get_verified_variable_guid(fwrt->trans,
 						   &IWL_EFI_WIFI_BT_GUID,
 						   IWL_UEFI_ECKV_NAME,
 						   "ECKV", sizeof(*data), NULL);
@@ -1242,7 +1243,7 @@ int iwl_uefi_get_dsbr(struct iwl_fw_runtime *fwrt, u32 *value)
 	struct uefi_cnv_wlan_dsbr_data *data;
 	int ret = 0;
 
-	data = iwl_uefi_get_verified_variable_guid(fwrt,
+	data = iwl_uefi_get_verified_variable_guid(fwrt->trans,
 						   &IWL_EFI_WIFI_BT_GUID,
 						   IWL_UEFI_DSBR_NAME, "DSBR",
 						   sizeof(*data), NULL);
@@ -1263,6 +1264,27 @@ int iwl_uefi_get_dsbr(struct iwl_fw_runtime *fwrt, u32 *value)
 	return ret;
 }
 
+int iwl_uefi_get_pdgc(struct iwl_trans *trans, u32 *value)
+{
+	struct uefi_cnv_common_pdgc_data *data __free(kfree);
+
+	data = iwl_uefi_get_verified_variable_guid(trans, &IWL_EFI_WIFI_BT_GUID,
+						   IWL_UEFI_PDGC_NAME, "PDGC",
+						   sizeof(*data), NULL);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	if (data->revision != IWL_UEFI_PDGC_REVISION) {
+		IWL_DEBUG_RADIO(trans, "Unsupported UEFI PDGC revision:%d\n",
+				data->revision);
+		return -EINVAL;
+	}
+
+	*value = data->platform_config & IWL_PDGC_REV0_PLATFORM_CONFIG_MASK;
+	IWL_DEBUG_RADIO(trans, "Loaded PDGC config from UEFI: 0x%x\n", *value);
+	return 0;
+}
+
 int iwl_uefi_get_phy_filters(struct iwl_fw_runtime *fwrt)
 {
 	struct uefi_cnv_wpfc_data *data __free(kfree);
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/uefi.h b/drivers/net/wireless/intel/iwlwifi/fw/uefi.h
index df5782862fef..74fda88b3fad 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/uefi.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/uefi.h
@@ -27,6 +27,7 @@
 #define IWL_UEFI_WBEM_NAME		L"UefiCnvWlanWBEM"
 #define IWL_UEFI_PUNCTURING_NAME	L"UefiCnvWlanPuncturing"
 #define IWL_UEFI_DSBR_NAME		L"UefiCnvCommonDSBR"
+#define IWL_UEFI_PDGC_NAME		L"UefiCnvCommonPDGC"
 #define IWL_UEFI_WPFC_NAME		L"WPFC"
 #define IWL_UEFI_UNEB_NAME		L"CnvUefiWlanUNEB"
 
@@ -44,6 +45,7 @@
 #define IWL_UEFI_PUNCTURING_REVISION	0
 #define IWL_UEFI_DSBR_REVISION		1
 #define IWL_UEFI_GLUI_REVISION		0
+#define IWL_UEFI_PDGC_REVISION		0
 
 struct pnvm_sku_package {
 	u8 rev;
@@ -310,6 +312,16 @@ struct uefi_cnv_wlan_dsbr_data {
 	u32 config;
 } __packed;
 
+/**
+ * struct uefi_cnv_common_pdgc_data - platform config as defined in UEFI
+ * @revision: the revision of the table
+ * @platform_config: platform configuration bitmap
+ */
+struct uefi_cnv_common_pdgc_data {
+	u8 revision;
+	u32 platform_config;
+} __packed;
+
 /**
  * struct uefi_cnv_wpfc_data - BIOS Wi-Fi PHY filter Configuration
  * @revision: the revision of the table
@@ -359,6 +371,7 @@ void iwl_uefi_get_uneb_table(struct iwl_trans *trans,
 			     struct iwl_fw_runtime *fwrt);
 int iwl_uefi_get_puncturing(struct iwl_fw_runtime *fwrt);
 int iwl_uefi_get_dsbr(struct iwl_fw_runtime *fwrt, u32 *value);
+int iwl_uefi_get_pdgc(struct iwl_trans *trans, u32 *value);
 int iwl_uefi_get_phy_filters(struct iwl_fw_runtime *fwrt);
 void iwl_uefi_get_guid_lock_status(struct iwl_trans *trans);
 #else /* CONFIG_EFI */
@@ -484,6 +497,11 @@ int iwl_uefi_get_dsbr(struct iwl_fw_runtime *fwrt, u32 *value)
 	return -ENOENT;
 }
 
+static inline int iwl_uefi_get_pdgc(struct iwl_trans *trans, u32 *value)
+{
+	return -ENOENT;
+}
+
 static inline int iwl_uefi_get_phy_filters(struct iwl_fw_runtime *fwrt)
 {
 	return -ENOENT;
-- 
2.34.1

