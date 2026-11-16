Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864108;
	b=yOsT5X33pqlf1emo3QEmqUm1o9qXRb5UzzltznXOVySCokozebL01PgliCRyM833chS7
	 1gixnlLQzFoGl7ayUTsGCpzXMuImCR6OZx4NYNaPmJ39EpNrycs5iQN8OFCP5GRgcqMgV
	 HdO3iEskTRqAxp3BYpyTxr+ogB/xRgPSzK6XMJ1u4eKmoWJz+8Qh4mJMld1l9atgU53W7
	 IXh0lY+0Lg93opiY1EhhInkan1Jj51NnLQtHJhaEWltVpXJtYGGT/e1dl1gFTPI8QizHB
	 KkTb1VO4oC/+gFr04kpejn9FwqzOlo/UBW2hWl/IRQqMGndUEil7lGCSAXt4lhA3Mzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864108;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=dKvDPwAHM4p+2eoj6b3Fr+sUOfBtZ3UgJXxAiwzAoxY=;
	b=LPLjcNL6jBd3AbtsGY/xic4lvAKlY2FGtn1GiQUL+iaX51NI8EkaHv6QVGquLqdzYYju
	 4OBkPMmVTvSAX2iI9G5hF0xE5Ot+5i5/Qy0RNOszutbiX5uscFdHh8xKebrJyLggXhqsH
	 ltngwBqcKGH2A4G1si3AkoDS/AAjic6wnleB6UYaX7/uoE2wbnd4gMaAqrAKO2Jyj146P
	 Plt9aY3562ZbJsiPlsOA96MNq2qhowsBjzyDoMYVEXRyFkP/DznT/OEfc0vYYLgnzqDVz
	 FkVulnkdpPJ0I3U4jcKJaw4MYY4507TJz7EIuU3zFnenDs2zoK3UNm+IxLz58aO7Ptg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VEdsnjVJ;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77A0606A339
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77A0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VEdsnjVJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864108; x=1826400108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=28JS7QGCdzmrVNPVikIJ7RY40rzH2OnQzBhAUhgOhMs=;
  b=VEdsnjVJeE5AdpQAYF5Sz/IFxha+U6xs80OcC1eGnz/kUEf9BmGOuOYt
   0DbXk0+/v2+sOE+17GMK63Z/xDg0wp2mF389Utx0LRuIOlV4xImn/wEjb
   wZp8Yh5fjvcP8FcaSIHvqpxlVMVv5NxqtmReZLhWf95oP8A0U0lyL4zyu
   fEGhyXeW011qAyvPl9jXIECMegmB7o2it42kNCCP6+/+duF07EToEbzk4
   BX53LHJbKubB1STGetUEc/rmET0fQBVv7LLHLA6aC0BZzNwKKUmf9FGtK
   7RjXRxYtMCCeSJNQMFYtxVwZNEG6bXPgRRxSH+TkzmI33NECQR0IlDzcd
   g==;
X-CSE-ConnectionGUID: /y6t7cGqTFCPTDTY6ZMV8A==
X-CSE-MsgGUID: fblXEWUHToKXFaQ++1DsgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604197"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604197"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:47 -0800
X-CSE-ConnectionGUID: sKgTeA1RQV67H2xwijN9hA==
X-CSE-MsgGUID: Ei5Y5osRSwmEh/Jx7l0GVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969117"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:46 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH iwlwifi-next 05/15] wifi: iwlwifi: mld: support CIGTK rekey in D3
Date: Mon, 16 Nov 2026 23:23:23 +0200
Message-Id: <20261116232138.4686118ea99f.I7b2e6f0a5d4c3e91b8f47a0c2d6e5f38a1c90b47@changeid>
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

From: Emmanuel Grumbach <emmanuel.grumbach@intel.com>

Send the cipher of the CIGTK to the firmware upon suspend, and upon
resume, update the CIGTK the firmware may have received while the
host was asleep, for both the active link and the other links.

Unlike the IGTK and the BIGTK, the CIGTK uses a data cipher and its
key indices are 0 and 1, which overlap with the GTK indices. Rely on
IEEE80211_KEY_FLAG_CIP to tell those apart in the key iterations.

Break when we find a match for the cigtk and rely on the firmware
reporting the valid keys first. Since keyidx == 0 is valid for a
cigtk, we must be sure that we don't override the Rx seq with the
data from a dummy entry coming from the firmware.

Assisted-by: LLM
Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/d3.c   | 150 +++++++++++-------
 .../net/wireless/intel/iwlwifi/mld/mac80211.c |   3 +-
 2 files changed, 90 insertions(+), 63 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/d3.c b/drivers/net/wireless/intel/iwlwifi/mld/d3.c
index c2c75db40749..53b3aba3e37e 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/d3.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/d3.c
@@ -58,6 +58,7 @@ struct iwl_mld_suspend_key_iter_data {
 	__le32 gtk_cipher;
 	__le32 igtk_cipher;
 	__le32 bigtk_cipher;
+	__le32 cigtk_cipher;
 };
 
 struct iwl_mld_wake_pkt_iter_data {
@@ -66,6 +67,15 @@ struct iwl_mld_wake_pkt_iter_data {
 	u32 icvlen;
 };
 
+/* CIP is set both on a CIGTK and on a pairwise key that protects control
+ * frames in addition to data
+ */
+static bool iwl_mld_is_cigtk(const struct ieee80211_key_conf *key)
+{
+	return !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE) &&
+	       key->flags & IEEE80211_KEY_FLAG_CIP;
+}
+
 static void
 iwl_mld_wake_pkt_key_iter(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  struct ieee80211_sta *sta,
@@ -75,7 +85,7 @@ iwl_mld_wake_pkt_key_iter(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct iwl_mld_wake_pkt_iter_data *data = _data;
 
 	/* ignore anything that is not a PTK / GTK */
-	if (key->keyidx > 3)
+	if (key->keyidx > 3 || iwl_mld_is_cigtk(key))
 		return;
 	if (is_group_key != data->multicast)
 		return;
@@ -123,6 +133,7 @@ struct iwl_mld_wowlan_mlo_key {
  * @gtk: data of the last two used gtk's by the FW upon resume
  * @igtk: data of the last used igtk by the FW upon resume
  * @bigtk: data of the last two used gtk's by the FW upon resume
+ * @cigtk: data of the last two used cigtk's by the FW upon resume
  * @ptk: last seq numbers per tid passed by the FW,
  *	holds both in tkip and aes formats
  * @num_mlo_keys: number of &struct iwl_mld_wowlan_mlo_key structs
@@ -141,6 +152,7 @@ struct iwl_mld_wowlan_status {
 	struct iwl_mld_mcast_key_data gtk[WOWLAN_GTK_KEYS_NUM];
 	struct iwl_mld_mcast_key_data igtk;
 	struct iwl_mld_mcast_key_data bigtk[WOWLAN_BIGTK_KEYS_NUM];
+	struct iwl_mld_mcast_key_data cigtk[WOWLAN_CIGTK_KEYS_NUM];
 	struct {
 		struct ieee80211_key_seq aes_seq[IWL_MAX_TID_COUNT];
 		struct ieee80211_key_seq tkip_seq[IWL_MAX_TID_COUNT];
@@ -413,70 +425,42 @@ iwl_mld_convert_mcast_ipn(struct iwl_mld_mcast_key_data *key_status,
 	}
 }
 
+/* Convert the IGTK/BIGTK/CIGTK material of the notification, they all use the
+ * same format and only differ in the base key index.
+ */
 static void
-iwl_mld_convert_igtk_resume_data(struct iwl_mld_wowlan_status *wowlan_status,
-				 const struct iwl_wowlan_igtk_status *igtk)
-{
-	if (!igtk->key_status)
-		return;
-
-	BUILD_BUG_ON(sizeof(wowlan_status->igtk.key) < sizeof(igtk->key));
-
-	wowlan_status->igtk.len = igtk->key_len;
-	wowlan_status->igtk.flags = igtk->key_flags;
-	wowlan_status->igtk.id =
-		u32_get_bits(igtk->key_flags,
-			     IWL_WOWLAN_IGTK_BIGTK_IDX_MASK) +
-		WOWLAN_IGTK_MIN_INDEX;
-
-	if (igtk->key_status == IWL_WOWLAN_STATUS_NEW_KEY)
-		memcpy(wowlan_status->igtk.key, igtk->key, sizeof(igtk->key));
-	else
-		/* If the key status is WOWLAN_STATUS_OLD_KEY, it indicates
-		 * that no key material is present. Set the key length to 0
-		 * as an indication.
-		 */
-		wowlan_status->igtk.len = 0;
-
-	iwl_mld_convert_mcast_ipn(&wowlan_status->igtk, igtk);
-}
-
-static void
-iwl_mld_convert_bigtk_resume_data(struct iwl_mld_wowlan_status *wowlan_status,
-				  const struct iwl_wowlan_igtk_status *bigtk)
+iwl_mld_convert_mcast_keys_resume_data(struct iwl_mld_mcast_key_data *key_data,
+				       const struct iwl_wowlan_igtk_status *keys,
+				       int num_keys, u8 min_key_idx)
 {
 	int status_idx = 0;
 
-	BUILD_BUG_ON(ARRAY_SIZE(wowlan_status->bigtk) < WOWLAN_BIGTK_KEYS_NUM);
-
-	for (int notif_idx = 0; notif_idx < WOWLAN_BIGTK_KEYS_NUM;
-	     notif_idx++) {
-		if (!bigtk[notif_idx].key_status)
+	for (int notif_idx = 0; notif_idx < num_keys; notif_idx++) {
+		if (!keys[notif_idx].key_status)
 			continue;
 
-		wowlan_status->bigtk[status_idx].len = bigtk[notif_idx].key_len;
-		wowlan_status->bigtk[status_idx].flags =
-			bigtk[notif_idx].key_flags;
-		wowlan_status->bigtk[status_idx].id =
-			u32_get_bits(bigtk[notif_idx].key_flags,
+		key_data[status_idx].len = keys[notif_idx].key_len;
+		key_data[status_idx].flags = keys[notif_idx].key_flags;
+		key_data[status_idx].id =
+			u32_get_bits(keys[notif_idx].key_flags,
 				     IWL_WOWLAN_IGTK_BIGTK_IDX_MASK)
-			+ WOWLAN_BIGTK_MIN_INDEX;
-
-		BUILD_BUG_ON(sizeof(wowlan_status->bigtk[status_idx].key) <
-			     sizeof(bigtk[notif_idx].key));
-		if (bigtk[notif_idx].key_status == IWL_WOWLAN_STATUS_NEW_KEY)
-			memcpy(wowlan_status->bigtk[status_idx].key,
-			       bigtk[notif_idx].key,
-			       sizeof(bigtk[notif_idx].key));
+			+ min_key_idx;
+
+		BUILD_BUG_ON(sizeof(key_data[status_idx].key) <
+			     sizeof(keys[notif_idx].key));
+		if (keys[notif_idx].key_status == IWL_WOWLAN_STATUS_NEW_KEY)
+			memcpy(key_data[status_idx].key,
+			       keys[notif_idx].key,
+			       sizeof(keys[notif_idx].key));
 		else
 			/* If the key status is WOWLAN_STATUS_OLD_KEY, it
 			 * indicates that no key material is present. Set the
 			 * key length to 0 as an indication.
 			 */
-			wowlan_status->bigtk[status_idx].len = 0;
+			key_data[status_idx].len = 0;
 
-		iwl_mld_convert_mcast_ipn(&wowlan_status->bigtk[status_idx],
-					  &bigtk[notif_idx]);
+		iwl_mld_convert_mcast_ipn(&key_data[status_idx],
+					  &keys[notif_idx]);
 		status_idx++;
 	}
 }
@@ -766,8 +750,21 @@ iwl_mld_handle_wowlan_info_notif(struct iwl_mld *mld,
 		iwl_mld_convert_ptk_resume_seq(mld, wowlan_status,
 					       &notif->gtk[0].sc);
 	/* only one igtk is passed by FW */
-	iwl_mld_convert_igtk_resume_data(wowlan_status, &notif->igtk[0]);
-	iwl_mld_convert_bigtk_resume_data(wowlan_status, notif->bigtk);
+	iwl_mld_convert_mcast_keys_resume_data(&wowlan_status->igtk,
+					       notif->igtk, 1,
+					       WOWLAN_IGTK_MIN_INDEX);
+
+	BUILD_BUG_ON(ARRAY_SIZE(wowlan_status->bigtk) < WOWLAN_BIGTK_KEYS_NUM);
+	iwl_mld_convert_mcast_keys_resume_data(wowlan_status->bigtk,
+					       notif->bigtk,
+					       WOWLAN_BIGTK_KEYS_NUM,
+					       WOWLAN_BIGTK_MIN_INDEX);
+
+	/* CIGTK key indices start at 0 */
+	BUILD_BUG_ON(ARRAY_SIZE(wowlan_status->cigtk) < WOWLAN_CIGTK_KEYS_NUM);
+	iwl_mld_convert_mcast_keys_resume_data(wowlan_status->cigtk,
+					       notif->cigtk,
+					       WOWLAN_CIGTK_KEYS_NUM, 0);
 
 	wowlan_status->replay_ctr = le64_to_cpu(notif->replay_ctr);
 	wowlan_status->pattern_number = le16_to_cpu(notif->pattern_number);
@@ -987,6 +984,12 @@ static void
 iwl_mld_update_mcast_rx_seq(struct ieee80211_key_conf *key,
 			    struct iwl_mld_mcast_key_data *key_data)
 {
+	if (iwl_mld_is_cigtk(key)) {
+		ieee80211_set_key_rx_seq(key, 0,
+					 &key_data->igtk_bigtk.cmac_gmac_seq);
+		return;
+	}
+
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_CCMP:
 	case WLAN_CIPHER_SUITE_GCMP:
@@ -1056,6 +1059,19 @@ iwl_mld_resume_keys_iter(struct ieee80211_hw *hw,
 						    RSC_NOTIF,
 						    IWL_FW_CMD_VER_UNKNOWN);
 
+	if (iwl_mld_is_cigtk(key)) {
+		for (int i = 0; i < ARRAY_SIZE(wowlan_status->cigtk); i++) {
+			struct iwl_mld_mcast_key_data *cigtk =
+				&wowlan_status->cigtk[i];
+
+			if (cigtk->id == key->keyidx) {
+				iwl_mld_update_mcast_rx_seq(key, cigtk);
+				break;
+			}
+		}
+		return;
+	}
+
 	/* If RSC_NOTIF is not supported */
 	if (rsc_notif_ver == IWL_FW_CMD_VER_UNKNOWN &&
 	    key->keyidx >= 0 && key->keyidx <= 3) {
@@ -1097,7 +1113,7 @@ iwl_mld_rsc_update_key_iter(struct ieee80211_hw *hw,
 	struct iwl_mld_rsc_resume_iter_data *data = _data;
 	struct ieee80211_key_seq seq;
 
-	if (key->keyidx > 3)
+	if (key->keyidx > 3 || iwl_mld_is_cigtk(key))
 		return;
 
 	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
@@ -1190,7 +1206,8 @@ static void
 iwl_mld_add_mcast_rekey(struct ieee80211_vif *vif,
 			struct iwl_mld *mld,
 			struct iwl_mld_mcast_key_data *key_data,
-			struct ieee80211_bss_conf *link_conf)
+			struct ieee80211_bss_conf *link_conf,
+			bool cigtk)
 {
 	struct ieee80211_key_conf *key_config;
 	int link_id = vif->active_links ? __ffs(vif->active_links) : -1;
@@ -1200,7 +1217,7 @@ iwl_mld_add_mcast_rekey(struct ieee80211_vif *vif,
 
 	key_config = ieee80211_gtk_rekey_add(vif, key_data->id, key_data->key,
 					     sizeof(key_data->key), link_id,
-					     false);
+					     cigtk);
 	if (IS_ERR(key_config))
 		return;
 
@@ -1243,13 +1260,18 @@ iwl_mld_add_all_rekeys(struct iwl_mld *mld,
 
 	for (i = 0; i < ARRAY_SIZE(wowlan_status->gtk); i++)
 		iwl_mld_add_mcast_rekey(vif, mld, &wowlan_status->gtk[i],
-					link_conf);
+					link_conf, false);
 
-	iwl_mld_add_mcast_rekey(vif, mld, &wowlan_status->igtk, link_conf);
+	iwl_mld_add_mcast_rekey(vif, mld, &wowlan_status->igtk, link_conf,
+				false);
 
 	for (i = 0; i < ARRAY_SIZE(wowlan_status->bigtk); i++)
 		iwl_mld_add_mcast_rekey(vif, mld, &wowlan_status->bigtk[i],
-					link_conf);
+					link_conf, false);
+
+	for (i = 0; i < ARRAY_SIZE(wowlan_status->cigtk); i++)
+		iwl_mld_add_mcast_rekey(vif, mld, &wowlan_status->cigtk[i],
+					link_conf, true);
 }
 
 static void iwl_mld_mlo_rekey(struct iwl_mld *mld,
@@ -1283,7 +1305,8 @@ static void iwl_mld_mlo_rekey(struct iwl_mld *mld,
 
 		key = ieee80211_gtk_rekey_add(vif, mlo_key->idx, mlo_key->key,
 					      sizeof(mlo_key->key), link_id,
-					      false);
+					      mlo_key->type ==
+					      WOWLAN_MLO_GTK_KEY_TYPE_CIGTK);
 
 		if (IS_ERR(key))
 			continue;
@@ -1838,6 +1861,10 @@ iwl_mld_suspend_key_data_iter(struct ieee80211_hw *hw,
 			data->have_rsc = true;
 			return;
 		}
+		if (iwl_mld_is_cigtk(key)) {
+			data->cigtk_cipher = cipher;
+			return;
+		}
 		/* We're iterating from old to new, there're 4 possible
 		 * gtk ids, and only the last two keys matter
 		 */
@@ -1913,6 +1940,7 @@ iwl_mld_send_kek_kck_cmd(struct iwl_mld *mld,
 	kek_kck_cmd.gtk_cipher = data.gtk_cipher;
 	kek_kck_cmd.igtk_cipher = data.igtk_cipher;
 	kek_kck_cmd.bigtk_cipher = data.bigtk_cipher;
+	kek_kck_cmd.cigtk_cipher = data.cigtk_cipher;
 
 	IWL_DEBUG_WOWLAN(mld, "setting akm %d\n",
 			 rekey_data->akm);
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
index 728863d818fd..df1179b4c881 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
@@ -311,8 +311,7 @@ static bool iwl_mld_is_cip_supported(struct iwl_mld *mld)
 		return false;
 
 	/*
-	 * There is no D3 rekey support for the CIGTK,
-	 * this can be enabled once the firmware fully supports the feature.
+	 * D3 rekey support for the CIGTK wasn't tested yet.
 	 */
 	return false;
 }
-- 
2.34.1

