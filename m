Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992165;
	b=dTSjkqbrvTz2u/7iS0T43jRRLxK3NyrZtyUq9xztFHV7E428m3G6TN/agxBN9yqaOFvv
	 R6VeNFzIYhuIpTnAm/Z7JjhVjoRVJLWIecpkmFIXVQY2QpPxodOGTQQJgo87wcr6FZgH0
	 kDAhvFSIV7MPvaZ4LvL3u2StsEWL7qvtBbjywBJFi0utX8Pd3iGdoEBWyKxX6VNMpuRkw
	 BJ4Uoq2JUEebhCMU2jnCqvJ2BFrH4AiZEQq++CE4V/jOZo66BNjXqPQ4pEpbl2cyjftjl
	 +z1wzvUrhCjGGCc1TzD9HhjueftcYdpcES3EotFgHLxG9rpp98NAnpai0STOm/yAE3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992165;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=Gcsy+5WHFq6rhpsJhzLZ/5VJMqp3eqaw4f4uZJoc3hY=;
	b=kYBfkvu820/FvlSTwx4C4hDXYtzP1ww/4WuqUIOIbJ3x59qbO60qiXvSRgRKdnhEkUz5
	 NwfOicSlTBQGbTeJuAVvjxcKvyo8D8lqRE9RYKKFxt7FcSc0yJCngR34HbV80unWfgTqO
	 JesxlhT+VOilfcE643PNIwKyjTJKh44Mkm9I4ePtILqJ7qraiU+x6QkD6WCCUgU8Y1wot
	 Rkl/k1KmgonookLLGrP734Wbs3oBs+J0g8T3KG+d2gppquEWVRCA6c2gFzGI8nSXa1mzm
	 jCwZOjf9Q3nz9uUgpRB2aSqd+sGlUCxSOLvI1fAUZxxG98NjsIrm18O7wOykZd9pkNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsDY3OnX;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA1606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41AA1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RsDY3OnX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992166; x=1826528166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MF68axkFR/iO1NWuZYRrdM7na7+PN9alLIqQln75auw=;
  b=RsDY3OnXSQgBz55r+GhxP2Jt3drF62O4HUasitykC+sxhfuOzxQ5AAVS
   h/HcVCbBlORxFEe/vqdxh1Ptm0Uj+daR1T4ByLW4lbXN9kxTMrcJ8WLeO
   leDF7dBWu9pBLAzXZvsM72EKXFo2MuRN+2pEG2aR/TR3t9fM8C09x1llw
   JHHVm4iBMlWiEQLk3uK9Aojut8++g+1Rfcxj/d/t7x4JTF8OSArxdCUv6
   7x6xz0w1W3QlymwSfbDP+MIbNCBE5oVG2Tr3/Mqw4/mvTovZb+4UnpoAP
   u5lhG59ZmDGPOXQXDmrsJTTvcbDnzkQRNMfoOMj1oiTaK6fcrPRDjnJdV
   w==;
X-CSE-ConnectionGUID: iKKpRlDmTumnhzkb+BmfGg==
X-CSE-MsgGUID: ZKkPMf97Tzujre9HDTB1sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871955"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871955"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:06 -0800
X-CSE-ConnectionGUID: A6D8A0obTumSCZ8+q7VLVA==
X-CSE-MsgGUID: +4fsr4myQA2QHN+v9D9rIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000275"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:04 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Subject: [PATCH v2 iwlwifi-next 07/15] wifi: iwlwifi: move UEFI GUID lock status to transport
Date: Wed, 18 Nov 2026 10:57:39 +0200
Message-Id: <20261118105612.1bd355d28c26.Ie3c053dcd6655e5a95b611f0423919ef0b5ab91b@changeid>
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

Currently, it is initialized by the opmode, but now we will need this
information before the opmode even starts, when selecting the fseq image.
Store it in struct trans rather than in struct iwl_fw_runtime.

Resolve the BIOS GUID lock status while allocating the transport layer,
so it is cached once at probe time and available before an opmode and its
firmware runtime are created. This removes the need to query it whenever
an opmode starts.

Update the UEFI, ACPI, and regulatory helpers to operate directly on
struct iwl_trans. Firmware-runtime users access the cached status
through their transport pointer. Remove the per-opmode GUID lock status
queries.

Signed-off-by: Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/fw/acpi.c  | 14 ++++++-------
 drivers/net/wireless/intel/iwlwifi/fw/acpi.h  |  4 ++--
 drivers/net/wireless/intel/iwlwifi/fw/init.c  |  2 --
 .../wireless/intel/iwlwifi/fw/regulatory.c    | 18 +++++++++--------
 .../wireless/intel/iwlwifi/fw/regulatory.h    |  2 +-
 .../net/wireless/intel/iwlwifi/fw/runtime.h   |  4 ----
 drivers/net/wireless/intel/iwlwifi/fw/uefi.c  | 20 +++++++++----------
 drivers/net/wireless/intel/iwlwifi/fw/uefi.h  |  4 ++--
 .../net/wireless/intel/iwlwifi/iwl-trans.c    |  2 ++
 .../net/wireless/intel/iwlwifi/iwl-trans.h    |  4 ++++
 .../wireless/intel/iwlwifi/mld/regulatory.c   |  2 --
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c   |  2 --
 12 files changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/fw/acpi.c b/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
index 7b11316a3062..a1184da82b11 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/acpi.c
@@ -1266,23 +1266,23 @@ int iwl_acpi_get_phy_filters(struct iwl_fw_runtime *fwrt)
 }
 IWL_EXPORT_SYMBOL(iwl_acpi_get_phy_filters);
 
-void iwl_acpi_get_guid_lock_status(struct iwl_fw_runtime *fwrt)
+void iwl_acpi_get_guid_lock_status(struct iwl_trans *trans)
 {
 	union acpi_object *wifi_pkg, *data;
 	int tbl_rev;
 
-	data = iwl_acpi_get_object(fwrt->dev, ACPI_GLAI_METHOD);
+	data = iwl_acpi_get_object(trans->dev, ACPI_GLAI_METHOD);
 	if (IS_ERR(data))
 		return;
 
-	wifi_pkg = iwl_acpi_get_wifi_pkg(fwrt->dev, data,
+	wifi_pkg = iwl_acpi_get_wifi_pkg(trans->dev, data,
 					 ACPI_GLAI_WIFI_DATA_SIZE,
 					 &tbl_rev);
 	if (IS_ERR(wifi_pkg))
 		goto out_free;
 
 	if (tbl_rev != 0) {
-		IWL_DEBUG_RADIO(fwrt, "Invalid GLAI revision: %d\n", tbl_rev);
+		IWL_DEBUG_RADIO(trans, "Invalid GLAI revision: %d\n", tbl_rev);
 		goto out_free;
 	}
 
@@ -1291,12 +1291,12 @@ void iwl_acpi_get_guid_lock_status(struct iwl_fw_runtime *fwrt)
 	    UEFI_CNV_GUID_TEST_MODE)
 		goto out_free;
 
-	fwrt->uefi_tables_lock_status =
+	trans->uefi_tables_lock_status =
 		wifi_pkg->package.elements[1].integer.value;
 
-	IWL_DEBUG_RADIO(fwrt,
+	IWL_DEBUG_RADIO(trans,
 			"Loaded UEFI WIFI GUID lock status: %d from ACPI\n",
-			fwrt->uefi_tables_lock_status);
+			trans->uefi_tables_lock_status);
 out_free:
 	kfree(data);
 }
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/acpi.h b/drivers/net/wireless/intel/iwlwifi/fw/acpi.h
index b722beae2f00..c7c474555868 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/acpi.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/acpi.h
@@ -190,7 +190,7 @@ int iwl_acpi_get_ppag_table(struct iwl_fw_runtime *fwrt);
 
 int iwl_acpi_get_phy_filters(struct iwl_fw_runtime *fwrt);
 
-void iwl_acpi_get_guid_lock_status(struct iwl_fw_runtime *fwrt);
+void iwl_acpi_get_guid_lock_status(struct iwl_trans *trans);
 
 int iwl_acpi_get_dsm(struct iwl_fw_runtime *fwrt,
 		     enum iwl_dsm_funcs func, u32 *value);
@@ -266,7 +266,7 @@ static inline int iwl_acpi_get_phy_filters(struct iwl_fw_runtime *fwrt)
 	return -ENOENT;
 }
 
-static inline void iwl_acpi_get_guid_lock_status(struct iwl_fw_runtime *fwrt)
+static inline void iwl_acpi_get_guid_lock_status(struct iwl_trans *trans)
 {
 }
 
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/init.c b/drivers/net/wireless/intel/iwlwifi/fw/init.c
index f62c6a69f0dc..4eaf3c951d23 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/init.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/init.c
@@ -33,8 +33,6 @@ void iwl_fw_runtime_init(struct iwl_fw_runtime *fwrt, struct iwl_trans *trans,
 	fwrt->sanitize_ops = sanitize_ops;
 	fwrt->sanitize_ctx = sanitize_ctx;
 	fwrt->ops_ctx = ops_ctx;
-	/* default until the connectivity GUID lock status is resolved */
-	fwrt->uefi_tables_lock_status = UEFI_CNV_GUID_UNKNOWN;
 	for (i = 0; i < IWL_FW_RUNTIME_DUMP_WK_NUM; i++) {
 		fwrt->dump.wks[i].idx = i;
 		INIT_DELAYED_WORK(&fwrt->dump.wks[i].wk, iwl_fw_error_dump_wk);
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/regulatory.c b/drivers/net/wireless/intel/iwlwifi/fw/regulatory.c
index b6707312c188..01f24db2216b 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/regulatory.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/regulatory.c
@@ -477,7 +477,7 @@ IWL_EXPORT_SYMBOL(iwl_rfi_is_enabled_in_bios);
 
 /**
  * iwl_bios_get_guid_lock_status - resolve connectivity variables lock status
- * @fwrt: the firmware runtime context
+ * @trans: the transport context
  *
  * Determine the root-of-trust for the connectivity UEFI variables. The UEFI
  * GUID Lock Indicator (GLUI) is preferred: if it attests the tables as locked
@@ -485,16 +485,18 @@ IWL_EXPORT_SYMBOL(iwl_rfi_is_enabled_in_bios);
  * reports unlocked) the ACPI GUID Lock Indicator is consulted and can override
  * the GLUI result.
  *
- * This only caches the result in &fwrt->uefi_tables_lock_status
+ * This only caches the result in &trans->uefi_tables_lock_status
  * (see &enum iwl_uefi_cnv_guid_status).
  */
-void iwl_bios_get_guid_lock_status(struct iwl_fw_runtime *fwrt)
+void iwl_bios_get_guid_lock_status(struct iwl_trans *trans)
 {
-	iwl_uefi_get_guid_lock_status(fwrt);
-	if (fwrt->uefi_tables_lock_status == UEFI_CNV_GUID_LOCKED ||
-	    fwrt->uefi_tables_lock_status == UEFI_CNV_GUID_TEST_MODE)
+	/* default until the GUID lock status is resolved */
+	trans->uefi_tables_lock_status = UEFI_CNV_GUID_UNKNOWN;
+
+	iwl_uefi_get_guid_lock_status(trans);
+	if (trans->uefi_tables_lock_status == UEFI_CNV_GUID_LOCKED ||
+	    trans->uefi_tables_lock_status == UEFI_CNV_GUID_TEST_MODE)
 		return;
 
-	iwl_acpi_get_guid_lock_status(fwrt);
+	iwl_acpi_get_guid_lock_status(trans);
 }
-IWL_EXPORT_SYMBOL(iwl_bios_get_guid_lock_status);
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/regulatory.h b/drivers/net/wireless/intel/iwlwifi/fw/regulatory.h
index e32e107812b1..98fcb66f459e 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/regulatory.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/regulatory.h
@@ -265,7 +265,7 @@ bool iwl_puncturing_is_allowed_in_bios(u32 puncturing, u16 mcc);
 
 int iwl_bios_get_dsbr(struct iwl_fw_runtime *fwrt, u32 *value);
 int iwl_bios_get_phy_filters(struct iwl_fw_runtime *fwrt);
-void iwl_bios_get_guid_lock_status(struct iwl_fw_runtime *fwrt);
+void iwl_bios_get_guid_lock_status(struct iwl_trans *trans);
 
 static inline void iwl_bios_setup_step(struct iwl_trans *trans,
 				       struct iwl_fw_runtime *fwrt)
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/runtime.h b/drivers/net/wireless/intel/iwlwifi/fw/runtime.h
index 33ce06f1a60a..6a9e783e38ba 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/runtime.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/runtime.h
@@ -108,9 +108,6 @@ struct iwl_txf_iter_data {
  * @dump: debug dump data
  * @ap_type_cmd: AP type tables (for enablement on 6 GHz)
  * @ap_type_cmd_valid: if &ap_type_cmd is valid
- * @uefi_tables_lock_status: the status of the WIFI GUID UEFI variables lock,
- *	see &enum iwl_uefi_cnv_guid_status.
- *	Trust the UEFI variables if locked or in test mode.
  * @sar_profiles: sar profiles as read from WRDS/EWRD BIOS tables
  * @sar_standalone_profiles: standalone sar profiles as read from
  *	WSSS/EWSS BIOS tables (for Wi-Fi HB/UHB without concurrent BT)
@@ -229,7 +226,6 @@ struct iwl_fw_runtime {
 	bool sgom_enabled;
 	struct iwl_mcc_allowed_ap_type_cmd ap_type_cmd;
 	bool ap_type_cmd_valid;
-	u8 uefi_tables_lock_status;
 	struct iwl_phy_specific_cfg phy_filters;
 	enum bios_source dsm_source;
 	u8 dsm_revision;
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/uefi.c b/drivers/net/wireless/intel/iwlwifi/fw/uefi.c
index a654ab29ee42..6f08e3b19efc 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/uefi.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/uefi.c
@@ -146,13 +146,13 @@ iwl_uefi_get_verified_variable_guid(struct iwl_fw_runtime *fwrt,
 	u32 attributes = 0;
 	void *var;
 
-	if (fwrt->uefi_tables_lock_status == UEFI_CNV_GUID_UNLOCKED)
+	if (fwrt->trans->uefi_tables_lock_status == UEFI_CNV_GUID_UNLOCKED)
 		return ERR_PTR(-EINVAL);
 
 	/* In x86 either GLUI or GLAI should exist */
 	if ((IS_ENABLED(CONFIG_X86) || IS_ENABLED(CONFIG_X86_64) ||
 	     IS_ENABLED(CONFIG_X86_32)) &&
-	    fwrt->uefi_tables_lock_status == UEFI_CNV_GUID_UNKNOWN)
+	    fwrt->trans->uefi_tables_lock_status == UEFI_CNV_GUID_UNKNOWN)
 		return ERR_PTR(-EINVAL);
 
 	var = iwl_uefi_get_variable_guid(fwrt->trans,
@@ -163,7 +163,7 @@ iwl_uefi_get_verified_variable_guid(struct iwl_fw_runtime *fwrt,
 	if (IS_ERR(var))
 		return var;
 
-	if (fwrt->uefi_tables_lock_status != UEFI_CNV_GUID_UNKNOWN)
+	if (fwrt->trans->uefi_tables_lock_status != UEFI_CNV_GUID_UNKNOWN)
 		goto out;
 
 	/*
@@ -1292,10 +1292,10 @@ int iwl_uefi_get_phy_filters(struct iwl_fw_runtime *fwrt)
 	return 0;
 }
 
-void iwl_uefi_get_guid_lock_status(struct iwl_fw_runtime *fwrt)
+void iwl_uefi_get_guid_lock_status(struct iwl_trans *trans)
 {
 	struct uefi_cnv_var_glui *data __free(kfree) =
-		iwl_uefi_get_variable_guid(fwrt->trans,
+		iwl_uefi_get_variable_guid(trans,
 					   &IWL_EFI_GLUI_GUID,
 					   IWL_UEFI_GLUI_NAME, "GLUI",
 					   sizeof(*data), NULL, NULL);
@@ -1304,20 +1304,20 @@ void iwl_uefi_get_guid_lock_status(struct iwl_fw_runtime *fwrt)
 		return;
 
 	if (data->revision != IWL_UEFI_GLUI_REVISION) {
-		IWL_DEBUG_RADIO(fwrt, "Unsupported UEFI GLUI revision:%d\n",
+		IWL_DEBUG_RADIO(trans, "Unsupported UEFI GLUI revision:%d\n",
 				data->revision);
 		return;
 	}
 
 	/* UEFI_CNV_GUID_TEST_MODE is the max value the BIOS can report */
 	if (data->guid_lock_status > UEFI_CNV_GUID_TEST_MODE) {
-		IWL_DEBUG_RADIO(fwrt, "Invalid UEFI GUID lock status:%d\n",
+		IWL_DEBUG_RADIO(trans, "Invalid UEFI GUID lock status:%d\n",
 				data->guid_lock_status);
 		return;
 	}
 
-	fwrt->uefi_tables_lock_status = data->guid_lock_status;
+	trans->uefi_tables_lock_status = data->guid_lock_status;
 
-	IWL_DEBUG_RADIO(fwrt, "Loaded UEFI WIFI GUID lock status: %d\n",
-			fwrt->uefi_tables_lock_status);
+	IWL_DEBUG_RADIO(trans, "Loaded UEFI WIFI GUID lock status: %d\n",
+			trans->uefi_tables_lock_status);
 }
diff --git a/drivers/net/wireless/intel/iwlwifi/fw/uefi.h b/drivers/net/wireless/intel/iwlwifi/fw/uefi.h
index f4f7a447e528..df5782862fef 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/uefi.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/uefi.h
@@ -360,7 +360,7 @@ void iwl_uefi_get_uneb_table(struct iwl_trans *trans,
 int iwl_uefi_get_puncturing(struct iwl_fw_runtime *fwrt);
 int iwl_uefi_get_dsbr(struct iwl_fw_runtime *fwrt, u32 *value);
 int iwl_uefi_get_phy_filters(struct iwl_fw_runtime *fwrt);
-void iwl_uefi_get_guid_lock_status(struct iwl_fw_runtime *fwrt);
+void iwl_uefi_get_guid_lock_status(struct iwl_trans *trans);
 #else /* CONFIG_EFI */
 static inline void *iwl_uefi_get_pnvm(struct iwl_trans *trans, size_t *len)
 {
@@ -489,7 +489,7 @@ static inline int iwl_uefi_get_phy_filters(struct iwl_fw_runtime *fwrt)
 	return -ENOENT;
 }
 
-static inline void iwl_uefi_get_guid_lock_status(struct iwl_fw_runtime *fwrt)
+static inline void iwl_uefi_get_guid_lock_status(struct iwl_trans *trans)
 {
 }
 #endif /* CONFIG_EFI */
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-trans.c b/drivers/net/wireless/intel/iwlwifi/iwl-trans.c
index 6ddf4945ed1c..e75d3a6cf5a6 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-trans.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-trans.c
@@ -14,6 +14,7 @@
 #include "iwl-prph.h"
 #include <linux/dmapool.h>
 #include "fw/api/commands.h"
+#include "fw/regulatory.h"
 
 struct iwl_trans_dev_restart_data {
 	struct list_head list;
@@ -287,6 +288,7 @@ struct iwl_trans *iwl_trans_alloc(unsigned int priv_size,
 #endif
 
 	trans->dev = dev;
+	iwl_bios_get_guid_lock_status(trans);
 
 	INIT_DELAYED_WORK(&trans->restart.wk, iwl_trans_restart_wk);
 
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
index a07dd492beb5..c65d9f012d15 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-trans.h
@@ -770,6 +770,9 @@ struct iwl_trans_ops;
  *	worker that should be scheduled (with appropriate reason)
  * @do_top_reset: indication to the (PCIe) transport/context-info
  *	to do the TOP reset
+ * @uefi_tables_lock_status: the status of the WIFI GUID UEFI variables lock,
+ *	see &enum iwl_uefi_cnv_guid_status.
+ *	Trust the UEFI variables if locked or in test mode.
  */
 struct iwl_trans {
 	bool csme_own;
@@ -811,6 +814,7 @@ struct iwl_trans {
 
 	u8 request_top_reset:1,
 	   do_top_reset:1;
+	u8 uefi_tables_lock_status;
 
 	/* pointer to trans specific struct */
 	/*Ensure that this pointer will always be aligned to sizeof pointer */
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/regulatory.c b/drivers/net/wireless/intel/iwlwifi/mld/regulatory.c
index 8a20d7622329..e9d7a23fda3c 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/regulatory.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/regulatory.c
@@ -36,8 +36,6 @@ void iwl_mld_get_bios_tables(struct iwl_mld *mld)
 {
 	int ret;
 
-	iwl_bios_get_guid_lock_status(&mld->fwrt);
-
 	ret = iwl_bios_get_ppag_table(&mld->fwrt);
 	if (ret < 0) {
 		IWL_DEBUG_RADIO(mld,
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/fw.c b/drivers/net/wireless/intel/iwlwifi/mvm/fw.c
index ae109e3ea141..bad54d17d27d 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/fw.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/fw.c
@@ -1576,8 +1576,6 @@ void iwl_mvm_get_bios_tables(struct iwl_mvm *mvm)
 {
 	int ret;
 
-	iwl_bios_get_guid_lock_status(&mvm->fwrt);
-
 	/* read PPAG table */
 	ret = iwl_bios_get_ppag_table(&mvm->fwrt);
 	if (ret < 0) {
-- 
2.34.1

