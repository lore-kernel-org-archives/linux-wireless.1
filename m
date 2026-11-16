Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864116;
	b=cr37I+8gB2nB14ccp3u/YQi9ePDnWlvumjZ8OOoYEgf8Qmi4M4G178/YiYhmQLfVWRC3
	 1yQ4lDe4xKDnt0XNcDbpVX+UslRj0gEZq6Q5yIryvd7dtN+CIk5xNjIMXIUcp4Oc4REp0
	 06zhUeXT2l/1XWqiEnrebFSzqsLVFuNvM9ndEjE+TZrYnfGOr/bTmPy2zNcL6gOHilhIX
	 Cp+E5mbpbX6v1MvnDRYSycZUGWZ96DMY4auiRaFGsPRJURH4VG+6zjtLjujDPQQh1i7X7
	 1sSNKiTWW6anvJWUBC5IYnGF+gr32+0HdgYg+agJZQuPDeEf/pRqgdgEtjD1+yQedIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864116;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=g3GSqJ8CZLBahhBwUI9HVCBEC34l6Gw0YVRZz3jYyJg=;
	b=5mKTcAEZW3xjAG3VWhCMzFJhLJM2Y66DukL1ZyzgDwT4LX/hInZC5Fp5TJdvy44IjU7k
	 dTyP8q90QS+IAzZNUcbCBG2lmS5aaZm4/fXlLURqxRRYW1C243njs0syUS8kyvj3zyrcL
	 fZDKEzKmOsWC3PCqLHyyzfRnlfIZKH/+hg+QY6D2lf8n2N1sL3vzV63jkvmcorjhZ5OVu
	 t8J2Fsjo64TFBqkdfXrzgGKIw+SzPWiRSFrZ/bGqY42tyza9PwoqJSbpS1Jvyo1jGZTdn
	 2F2TsLYVOpcsNmg0w7Y0NQssI6zNH/35lWla3JHZNmCJF/5o/fpGXkxMozt94xj4cFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JVWGgIqz;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7133606A331
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7133606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JVWGgIqz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864116; x=1826400116;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VbZ8V7bn9z+AvAb8HAGiABYBZAnzni7lAYVrLrpTH1s=;
  b=JVWGgIqzH6cmOvrnC0Dhxa3G71o2TTcg6YRdd7ii3TXA7qOfdhw3/wgW
   9e3by+T2PywNGc8MEaH8+d5GoK9L9d0Bs53x/GdhS1cklP1FJJrdUdLyn
   LgoWVgHbDbMFFyM7HJa3TsW5Crb9usiyDeMPnOZGqgxT2VJ9PxWigjR4U
   59jU4MC3lXlrYd/PvO9Zo3jiwFcUC67SPi8tc48XOn20gWWtfnUU4lL5y
   AJ9oeJ5erMgdbx8SytSzMrOWkorkOxYBt6erkjcnObanwvNxlC6z46Dd2
   7utNmUXuxGQJfB/5kTC1ymOY4YAbLhycL+5Y/JqdrzeUdD9J1DCmqeR3I
   g==;
X-CSE-ConnectionGUID: 6/1u8TRwQXOYgJJWfJlqAA==
X-CSE-MsgGUID: Wn0akZhrT/ald6mIDGFwfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604204"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604204"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:56 -0800
X-CSE-ConnectionGUID: yAooapiaRjKggA7NtaBvaQ==
X-CSE-MsgGUID: IHaiATV9RwOV7qWVHEe3FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969147"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:55 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH iwlwifi-next 11/15] wifi: iwlwifi: dbg: rename the time point sync argument
Date: Mon, 16 Nov 2026 23:23:29 +0200
Message-Id: <20261116232138.5a1cab5b2e97.I3ee72c836f8d514c527335a3e59389a03280eddc@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116212333.2404653-1-miriam.rachel.korenblit@intel.com>
References: <20261116212333.2404653-1-miriam.rachel.korenblit@intel.com>
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

