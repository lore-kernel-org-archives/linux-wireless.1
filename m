Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864105;
	b=1NLFioxN0LBspVWl36+Uv9C+1R633Ii+FVFJCSaiYrmtNYH3f/JEbzSeHc4pesYQPOji
	 jJgSIWeu7TuhrJqSquFQYFjynIySebCDVf8Ca1bVMDcYKE0Fo44Sotz4OXhDt1wb9Si57
	 n6LGsVDmzOw8I7Q5qVSejDDlMjGHdVZYstoytBMSf4Fbdg6qo2xWn9ogArlqSaOEuAUtW
	 S3/1LrPYF8V5042aio1FONflMfQGvFbfBXKoBomiTVGlABCaGWnFrkK0w4froQQOLEYWO
	 yzTu4nZIT17YhQhTZaMyUb0cZ3NBjb0OBXWGyGFP7w3uYkqazhfDkUnm7QspHDEs02Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864105;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=daW1seqW4xagCdSG8AnCovjOguK2mjuERwWYi2MASkY=;
	b=XW0si41A2E8I+86LUX7iTAwPNz6I0pODIhSZci+0MKaNpKR15p2pw2E+1fm+dhztqlyD
	 4qM7ixG2zv3xkDr/4oa76UwlVRbtwAjF/iYuOFIVbWl7uQR3zFT7kn/avAXU+JyZwBMg/
	 4Q5/0XV1+U0Lenx5/dHNNHfi7GyCIYIS9U2IWcKLWFZ3EdzQnucR6LOdPd+j5+IhxIr2u
	 Aca1EFdyzGSl0R6c8Vb8lx9o6ruw9eWNkUdUeeOAHeS80Dz2gPmAYyRhZhA2SF7pTHNIw
	 wll4whAwWGHGTSgEb7h3UbSbccpl8CyxKoqqTPf89posQCWZYbW8n45/mBhpF/+MmdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fRSQCeub;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A32606A881
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95A32606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fRSQCeub
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864104; x=1826400104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CZHjflpxYecSxGKxypVv/Yp0Bx+buPBdCokWD0OcP+E=;
  b=fRSQCeubr6+LYuKaJl+8/oTlGTJn2/+jJ1CZShWMqCu3D12q5Mx4ik/l
   MoGXbFZcx4RLO20RNPTsdMzJP7QWOC4PVNoF583rHR0+Xa61VZj+ZjKfG
   +fkxp2UTWwNk7MYBzu/MAUnoeBYo/Mr7yrN99eEKYFAh7scscj8U07/ko
   dvS0W6ePQBm2ZOomyfM7veW1hJJhzRCBCxqROKQ0GX3HpXsWISjmNOi5G
   tGg8p9rpZfftotPoXwiTGcQbOpnH9uQeNH9AaTyXhQFCoiXp7aqrfthq/
   yzHUSN88K8DMOq9IFYEEHi07ElxTbUol49rHlCsj4WdHKSZ6rEs2JkwnI
   A==;
X-CSE-ConnectionGUID: Q9bGnd5bTZObzPWJBXRNHw==
X-CSE-MsgGUID: eQQKEYbnSe6MopMgEc6R5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604194"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604194"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:44 -0800
X-CSE-ConnectionGUID: DQ+46mo9RUGjGwJuzOTtww==
X-CSE-MsgGUID: mTACQGmLRXydq0KDgpBZ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969097"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:43 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH iwlwifi-next 03/15] wifi: iwlwifi: mld: request per-STA GTKs for the AP
Date: Mon, 16 Nov 2026 23:23:21 +0200
Message-Id: <20261116232138.986bdcfcff34.I50229b16c33419e4875020d1074aa444f4cfa282@changeid>
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

From: Johannes Berg <johannes.berg@intel.com>

Request getting the STA pointer for the AP for GTKs
installed in client mode, and remove the code that
was necessary to work around not having them while
the firmware requires the station entry.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/d3.c   |  8 ++--
 drivers/net/wireless/intel/iwlwifi/mld/key.c  | 46 +------------------
 drivers/net/wireless/intel/iwlwifi/mld/key.h  |  6 +--
 .../net/wireless/intel/iwlwifi/mld/mac80211.c | 13 +-----
 drivers/net/wireless/intel/iwlwifi/mld/sta.c  |  7 ---
 5 files changed, 8 insertions(+), 72 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/d3.c b/drivers/net/wireless/intel/iwlwifi/mld/d3.c
index 77e485034e3b..c2c75db40749 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/d3.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/d3.c
@@ -71,8 +71,8 @@ iwl_mld_wake_pkt_key_iter(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  struct ieee80211_sta *sta,
 			  struct ieee80211_key_conf *key, void *_data)
 {
+	bool is_group_key = !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE);
 	struct iwl_mld_wake_pkt_iter_data *data = _data;
-	bool is_group_key = !sta;
 
 	/* ignore anything that is not a PTK / GTK */
 	if (key->keyidx > 3)
@@ -1060,7 +1060,7 @@ iwl_mld_resume_keys_iter(struct ieee80211_hw *hw,
 	if (rsc_notif_ver == IWL_FW_CMD_VER_UNKNOWN &&
 	    key->keyidx >= 0 && key->keyidx <= 3) {
 		/* PTK */
-		if (sta) {
+		if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
 			iwl_mld_update_ptk_rx_seq(data->mld, wowlan_status,
 						  sta, key,
 						  key->cipher ==
@@ -1100,7 +1100,7 @@ iwl_mld_rsc_update_key_iter(struct ieee80211_hw *hw,
 	if (key->keyidx > 3)
 		return;
 
-	if (sta) {
+	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
 		/* PTK */
 		BUILD_BUG_ON(ARRAY_SIZE(data->notif->ucast_rsc) !=
 			     IWL_MAX_TID_COUNT);
@@ -1827,7 +1827,7 @@ iwl_mld_suspend_key_data_iter(struct ieee80211_hw *hw,
 	case WLAN_CIPHER_SUITE_TKIP:
 		if (!cipher)
 			cipher = cpu_to_le32(STA_KEY_FLG_TKIP);
-		if (sta) {
+		if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
 			key_rsc = data->rsc->ucast_rsc;
 			if (key->cipher == WLAN_CIPHER_SUITE_TKIP)
 				iwl_mld_suspend_convert_tkip_ipn(key, key_rsc);
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/key.c b/drivers/net/wireless/intel/iwlwifi/mld/key.c
index 74b483783de8..5ee5e0ed0350 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/key.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/key.c
@@ -346,49 +346,6 @@ int iwl_mld_add_key(struct iwl_mld *mld,
 	return 0;
 }
 
-struct remove_ap_keys_iter_data {
-	u8 link_id;
-	struct ieee80211_sta *sta;
-};
-
-static void iwl_mld_remove_ap_keys_iter(struct ieee80211_hw *hw,
-					struct ieee80211_vif *vif,
-					struct ieee80211_sta *sta,
-					struct ieee80211_key_conf *key,
-					void *_data)
-{
-	struct iwl_mld *mld = IWL_MAC80211_GET_MLD(hw);
-	struct remove_ap_keys_iter_data *data = _data;
-
-	if (key->hw_key_idx == STA_KEY_IDX_INVALID)
-		return;
-
-	/* All the pairwise keys should have been removed by now */
-	if (WARN_ON(sta))
-		return;
-
-	if (key->link_id >= 0 && key->link_id != data->link_id)
-		return;
-
-	iwl_mld_remove_key(mld, vif, data->sta, key);
-}
-
-void iwl_mld_remove_ap_keys(struct iwl_mld *mld, struct ieee80211_vif *vif,
-			    struct ieee80211_sta *sta, unsigned int link_id)
-{
-	struct remove_ap_keys_iter_data iter_data = {
-		.link_id = link_id,
-		.sta = sta,
-	};
-
-	if (WARN_ON_ONCE(vif->type != NL80211_IFTYPE_STATION))
-		return;
-
-	ieee80211_iter_keys(mld->hw, vif,
-			    iwl_mld_remove_ap_keys_iter,
-			    &iter_data);
-}
-
 struct iwl_mvm_sta_key_update_data {
 	struct ieee80211_sta *sta;
 	u32 old_sta_mask;
@@ -414,8 +371,7 @@ static void iwl_mld_update_sta_key_iter(struct ieee80211_hw *hw,
 	};
 	int err;
 
-	/* only need to do this for pairwise keys (link_id == -1) */
-	if (sta != data->sta || key->link_id >= 0)
+	if (sta != data->sta || !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE))
 		return;
 
 	err = iwl_mld_send_cmd_pdu(mld, WIDE_ID(DATA_PATH_GROUP, SEC_KEY_CMD),
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/key.h b/drivers/net/wireless/intel/iwlwifi/mld/key.h
index 5a9efdaa3b03..ddd1e7b52e4b 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/key.h
+++ b/drivers/net/wireless/intel/iwlwifi/mld/key.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
 /*
- * Copyright (C) 2024 Intel Corporation
+ * Copyright (C) 2024. 2026 Intel Corporation
  */
 #ifndef __iwl_mld_key_h__
 #define __iwl_mld_key_h__
@@ -17,10 +17,6 @@ int iwl_mld_add_key(struct iwl_mld *mld,
 		    struct ieee80211_vif *vif,
 		    struct ieee80211_sta *sta,
 		    struct ieee80211_key_conf *key);
-void iwl_mld_remove_ap_keys(struct iwl_mld *mld,
-			    struct ieee80211_vif *vif,
-			    struct ieee80211_sta *sta,
-			    unsigned int link_id);
 
 int iwl_mld_update_sta_keys(struct iwl_mld *mld,
 			    struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
index 821cd2d2a73b..728863d818fd 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
@@ -263,6 +263,7 @@ static void iwl_mac_hw_set_flags(struct iwl_mld *mld)
 	ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
 	ieee80211_hw_set(hw, SUPPORTS_AMSDU_IN_AMPDU);
 	ieee80211_hw_set(hw, TDLS_WIDER_BW);
+	ieee80211_hw_set(hw, PER_STA_AP_GTK);
 }
 
 static void iwl_mld_hw_set_nan(struct iwl_mld *mld)
@@ -2355,20 +2356,9 @@ static int iwl_mld_mac80211_set_key(struct ieee80211_hw *hw,
 				    struct ieee80211_sta *sta,
 				    struct ieee80211_key_conf *key)
 {
-	struct iwl_mld_vif *mld_vif = iwl_mld_vif_from_mac80211(vif);
 	struct iwl_mld *mld = IWL_MAC80211_GET_MLD(hw);
 	int ret;
 
-	/*
-	 * FW always needs the AP STA for client mode.
-	 * Note that during removal this could already
-	 * be NULL (mac80211 removes keys after STAs)
-	 * but then we'll already have removed the key
-	 * and set hw_key_idx = STA_KEY_IDX_INVALID.
-	 */
-	if (!sta && vif->type == NL80211_IFTYPE_STATION)
-		sta = mld_vif->ap_sta;
-
 	switch (cmd) {
 	case SET_KEY:
 		ret = iwl_mld_set_key_add(mld, vif, sta, key);
@@ -2595,6 +2585,7 @@ static void iwl_mld_sta_pre_rcu_remove(struct ieee80211_hw *hw,
 	 * on further RCU synchronisation after the sta_state()
 	 * callback deleted the station.
 	 */
+
 	for_each_mld_link_sta(mld_sta, mld_link_sta, link_id)
 		RCU_INIT_POINTER(mld->fw_id_to_link_sta[mld_link_sta->fw_id],
 				 NULL);
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/sta.c b/drivers/net/wireless/intel/iwlwifi/mld/sta.c
index cfdf7c1baaaf..d66b1164b8e2 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/sta.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/sta.c
@@ -920,13 +920,6 @@ void iwl_mld_remove_sta(struct iwl_mld *mld, struct ieee80211_sta *sta)
 		iwl_mld_remove_txq(mld, sta->txq[i]);
 
 	for_each_sta_active_link(sta, link_sta, link_id) {
-		/* Mac8011 will remove the groupwise keys after the sta is
-		 * removed, but FW expects all the keys to be removed before
-		 * the STA is, so remove them all here.
-		 */
-		if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
-			iwl_mld_remove_ap_keys(mld, vif, sta, link_id);
-
 		/* Remove the link_sta */
 		iwl_mld_remove_link_sta(mld, link_sta);
 	}
-- 
2.34.1

