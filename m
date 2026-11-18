Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992171;
	b=L/ouNPpnsNL6b/nkIywdoEPcAjz/sbsORTFOZG41BdK5a3Qi0ZHf6+RWd0RueYTXMRJD
	 E0IDr7VY2On+0ZjHYDesUlgjzEaNlaj9F2wtdBIwwQSI9iPoJVFGBcLmDuFQS6rN62yJF
	 Lyg1JLMhrYwFqfhKNgAAsW5Nx3lsCutvmXrtJpyvuybhl666J1cxPAaQkh7BWMNgwfsY+
	 MlwuoYVgNs9bOAO5bTXSnnJzn9e1eB+nLw2cSp+AKvFAh/aE0JQd6o3mqN6X+p7AmL0PD
	 XlETjC0ieyMmQ2nu73cnwXa96Y21LEXv1W/tzskQJZR+xlcBU0TxcyZBxdctKOpqZrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992171;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=g3GSqJ8CZLBahhBwUI9HVCBEC34l6Gw0YVRZz3jYyJg=;
	b=SNP5640DWY1ZJyApCDJWYtI5hangiYBVqimC+Gm0T7r7fq/gHR7Lb3ipmk1AZMi7WdDj
	 WyZSUNbX5n9JgScLllcmhVhKRl+slbfJuFFVDPhHDhZFmucjLaIJZZS3whXNa7/jmFSaW
	 f5E/jRAaticQDUQzLaLfV2eGMp3ZTD4pXpT3OvYCAuVLWwM+qXg61j+T6Dz1kOagdbDuB
	 SDrOhpIaenf+z6Lfqk20LauZ4TS4q5fiRQELF96DD+nKOZQufXkleMBd5blvUtg7KOpTE
	 fclBrMpaa59IBc8IqegQYOhfBvj8lqbQ9x8eg4AqfzpA2R35DhYVXAjr15/AxRmqynw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gvEz+WW3;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EEB606A335
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EEB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gvEz+WW3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992172; x=1826528172;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VbZ8V7bn9z+AvAb8HAGiABYBZAnzni7lAYVrLrpTH1s=;
  b=gvEz+WW39owJrUKoV1mGYLm7ZGmQ30yWXiZf4rOMm98TQcxtLIB4joAU
   lTWAoinLCzuAiyhg1HSssWSyAHAvHdFRgTpBilniBBAJ5/4lPbuXYBgEu
   uonoNeuFE1m2ErpBN1R4SouoOt3oTBUQKwLjR8KiWUqqQhR1JlkzbP9Lu
   27YjLIJ9WoxYcrdCSvAbQyRu86VtHoUxqMKGTQkl9/nU+LRmPGMwqmjyt
   BUZ9oXwFWDvhbuIIfe09Vm/7+bANQ3nOuFUSuHhc/CqjMqFQM/fUot9/V
   Fhx6S9qW39mtWOi0B4zjxgP27loBAt1ogLjH5Do5fvS9klbs7mWouBzCy
   A==;
X-CSE-ConnectionGUID: iIVkP8SmRbeOaO345y4Y8w==
X-CSE-MsgGUID: zX2KRNkDQFiVZpUTLFSFTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871966"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871966"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:12 -0800
X-CSE-ConnectionGUID: kzKG++fHTumpmuujECxQNw==
X-CSE-MsgGUID: y5f0h2LWTuyJ0DK8EVUcmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000331"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:09 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH v2 iwlwifi-next 11/15] wifi: iwlwifi: dbg: rename the time point sync argument
Date: Wed, 18 Nov 2026 10:57:43 +0200
Message-Id: <20261118105612.5a1cab5b2e97.I3ee72c836f8d514c527335a3e59389a03280eddc@changeid>
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

The sync argument of _iwl_dbg_tlv_time_point() was added to collect the
debug data inline rather than from a worker, for flows in which the device
is about to be turned off right after the time point. It doesn't say
anything else about the time point.

Rename it to sync_dump to make this clear, before adding another argument
that describes the calling context.

Assisted-by: LLM
Reviewed-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 .../net/wireless/intel/iwlwifi/iwl-dbg-tlv.c  | 21 ++++++++++++-------
 .../net/wireless/intel/iwlwifi/iwl-dbg-tlv.h  |  2 +-
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
index cc6044222b5c..a64f958bbe5f 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
@@ -1242,7 +1242,7 @@ static bool iwl_dbg_tlv_check_fw_pkt(struct iwl_fw_runtime *fwrt,
 }
 
 static int
-iwl_dbg_tlv_tp_trigger(struct iwl_fw_runtime *fwrt, bool sync,
+iwl_dbg_tlv_tp_trigger(struct iwl_fw_runtime *fwrt, bool sync_dump,
 		       struct list_head *active_trig_list,
 		       union iwl_dbg_tlv_tp_data *tp_data,
 		       bool (*data_check)(struct iwl_fw_runtime *fwrt,
@@ -1263,7 +1263,8 @@ iwl_dbg_tlv_tp_trigger(struct iwl_fw_runtime *fwrt, bool sync,
 
 
 		if (!num_data) {
-			ret = iwl_fw_dbg_ini_collect(fwrt, &dump_data, sync);
+			ret = iwl_fw_dbg_ini_collect(fwrt, &dump_data,
+						     sync_dump);
 			if (ret)
 				return ret;
 		}
@@ -1272,7 +1273,8 @@ iwl_dbg_tlv_tp_trigger(struct iwl_fw_runtime *fwrt, bool sync,
 			if (!data_check ||
 			    data_check(fwrt, &dump_data, tp_data,
 				       le32_to_cpu(dump_data.trig->data[i]))) {
-				ret = iwl_fw_dbg_ini_collect(fwrt, &dump_data, sync);
+				ret = iwl_fw_dbg_ini_collect(fwrt, &dump_data,
+							     sync_dump);
 				if (ret)
 					return ret;
 
@@ -1397,7 +1399,7 @@ void iwl_dbg_tlv_init_cfg(struct iwl_fw_runtime *fwrt)
 void _iwl_dbg_tlv_time_point(struct iwl_fw_runtime *fwrt,
 			     enum iwl_fw_ini_time_point tp_id,
 			     union iwl_dbg_tlv_tp_data *tp_data,
-			     bool sync)
+			     bool sync_dump)
 {
 	struct list_head *hcmd_list, *trig_list, *conf_list;
 
@@ -1414,13 +1416,15 @@ void _iwl_dbg_tlv_time_point(struct iwl_fw_runtime *fwrt,
 	case IWL_FW_INI_TIME_POINT_EARLY:
 		iwl_dbg_tlv_init_cfg(fwrt);
 		iwl_dbg_tlv_update_drams(fwrt);
-		iwl_dbg_tlv_tp_trigger(fwrt, sync, trig_list, tp_data, NULL);
+		iwl_dbg_tlv_tp_trigger(fwrt, sync_dump, trig_list, tp_data,
+				       NULL);
 		iwl_dbg_tlv_apply_config(fwrt, conf_list);
 		break;
 	case IWL_FW_INI_TIME_POINT_AFTER_ALIVE:
 		iwl_dbg_tlv_apply_buffers(fwrt);
 		iwl_dbg_tlv_send_hcmds(fwrt, hcmd_list);
-		iwl_dbg_tlv_tp_trigger(fwrt, sync, trig_list, tp_data, NULL);
+		iwl_dbg_tlv_tp_trigger(fwrt, sync_dump, trig_list, tp_data,
+				       NULL);
 		iwl_dbg_tlv_apply_config(fwrt, conf_list);
 		break;
 	case IWL_FW_INI_TIME_POINT_PERIODIC:
@@ -1431,13 +1435,14 @@ void _iwl_dbg_tlv_time_point(struct iwl_fw_runtime *fwrt,
 	case IWL_FW_INI_TIME_POINT_MISSED_BEACONS:
 	case IWL_FW_INI_TIME_POINT_FW_DHC_NOTIFICATION:
 		iwl_dbg_tlv_send_hcmds(fwrt, hcmd_list);
-		iwl_dbg_tlv_tp_trigger(fwrt, sync, trig_list, tp_data,
+		iwl_dbg_tlv_tp_trigger(fwrt, sync_dump, trig_list, tp_data,
 				       iwl_dbg_tlv_check_fw_pkt);
 		iwl_dbg_tlv_apply_config(fwrt, conf_list);
 		break;
 	default:
 		iwl_dbg_tlv_send_hcmds(fwrt, hcmd_list);
-		iwl_dbg_tlv_tp_trigger(fwrt, sync, trig_list, tp_data, NULL);
+		iwl_dbg_tlv_tp_trigger(fwrt, sync_dump, trig_list, tp_data,
+				       NULL);
 		iwl_dbg_tlv_apply_config(fwrt, conf_list);
 		break;
 	}
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.h b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.h
index fe4e46a0edbd..886d21ab6a53 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.h
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.h
@@ -56,7 +56,7 @@ void iwl_dbg_tlv_init(struct iwl_trans *trans);
 void _iwl_dbg_tlv_time_point(struct iwl_fw_runtime *fwrt,
 			     enum iwl_fw_ini_time_point tp_id,
 			     union iwl_dbg_tlv_tp_data *tp_data,
-			     bool sync);
+			     bool sync_dump);
 void iwl_dbg_tlv_init_cfg(struct iwl_fw_runtime *fwrt);
 
 static inline void iwl_dbg_tlv_time_point(struct iwl_fw_runtime *fwrt,
-- 
2.34.1

