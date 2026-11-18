Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992156;
	b=bnzvzUWf2UcCdJ4uhcfaIW/tX8exfFyWyLk2+G0rL1Cdc81AM6Siwv/1hhRLzIWwfzw4
	 oBoW61QUQ+mOBCaBi4SX+ukMGEXFohmYIEpLwNTnWd02bgVrhHfLC+BbUKlrBJgTkOnIn
	 7X7scuS77r6++zaucnSqJ3jUdO5jujkneGbMKKcD5Z0iuArrxmfJdOr2/G6p9EsG++NNH
	 5uHX9saJyPODXX5W/y5P6JWfCfZFShHOBOaTrnIu21KkDnd2ic7w/A4t4/+mT8GUuWiSF
	 TDLj84IGzL2Tah79t4zDnLuP1PEThLVQT5c2E3s3z+wXt/nzR3NaPeAXINZ9jSk2/9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992156;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=PF77GFZZQLgW8SSIuGTEHPXjSiEdeZ1lsERACIemzjM=;
	b=47Iyk1qwQYRwmCu6MPzv7G13+i76h6E7LiB6Akt41NjTTJJjGBGSKxkWZFDH+Jhou6Uo
	 ZoPTCEo1Awzi8PlPcI/vwv7TSpkdXsHe7ZZnGHeXAgHiEkjGMpAfFhzOa+AtlG2ODsWnQ
	 qVQhU+PGLyjoM2Y6qcai4gqWvKq9n4Nd39kcnVkod1AEYMGGh3V75Hf6uum97PFPE8UPQ
	 B20uUiPflj4vdQbRwO5nJlJGZKEPC+QJXH1Oyrx2H+WvsFoAitywrwFhJt2I/fT+oGU/s
	 PT+4RgOElb+Pk4rBa763ojmMrrRcjB6D0CVT6BdS6AaldZsNDb5yYxg03yp7igpt7/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="GLOlnC/R";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D85606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D85606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GLOlnC/R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992157; x=1826528157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b14suSaJw7B4n3srolU0W5rOkcGhYwE6s5xPf5fyFwM=;
  b=GLOlnC/RasL6RS/NPmcdygUg8popUfUOROkgir9yorr75CI8rJOO8gxr
   e2bs/evzxgd0G1pz1j6jGADnhLlS16kh8zp0GBFDM7X5asvM36aOS+z4W
   7M769QmiAeySooWbKaRr1J1kjfpzGxlA+v9o9+beg8A5LM0IP1TKlMoHG
   qui8SZNTRpXzRt0JF6eUpLfOvI3VZ8AoVfJvTWTg2cI6xBtpjMK02+cMt
   s0txFrH4xBrwKR2WTG95htYP1iWKeSpUc4uyIfSxAqtRTyQk0rVVFJVx3
   N484E76vaWf5zzZiihulOR4YhYZWwxxxI23lF3mhA6R3/KRf0wkzB1Arf
   A==;
X-CSE-ConnectionGUID: JOzBJaM8QD2TZiruz0tRSw==
X-CSE-MsgGUID: 4VnX3z6kQquVZro07a07Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871945"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871945"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:55:57 -0800
X-CSE-ConnectionGUID: LyQW6ixRQRGENmHAANnULQ==
X-CSE-MsgGUID: ERZu55QbRDq8HSZ1SRtFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000180"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:55:55 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH v2 iwlwifi-next 01/15] wifi: iwlwifi: mld: handle CIP key installation
Date: Wed, 18 Nov 2026 10:57:33 +0200
Message-Id: <20261118105612.cc268a50f45d.If45c315ae6b9e1b221c2dc042ef29f9c42a34108@changeid>
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

From: Benjamin Berg <benjamin.berg@intel.com>

The CIGTK and pairwise key needs to be installed with the corresponding
flag when CIP is in use. Add the logic to set the correct flags and
install the CIGTK in station mode.

For AP mode, ignore the CIGTK installation. The firmware will never
generate frames that would need to be encrypted.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 .../net/wireless/intel/iwlwifi/fw/api/datapath.h  |  2 ++
 drivers/net/wireless/intel/iwlwifi/mld/key.c      |  3 +++
 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c | 15 +++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/fw/api/datapath.h b/drivers/net/wireless/intel/iwlwifi/fw/api/datapath.h
index eddf13325df9..78c991719c28 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/api/datapath.h
+++ b/drivers/net/wireless/intel/iwlwifi/fw/api/datapath.h
@@ -676,6 +676,7 @@ struct iwl_scd_queue_cfg_cmd {
  * @IWL_SEC_KEY_FLAG_MFP: MFP is in used for this key
  * @IWL_SEC_KEY_FLAG_MCAST_KEY: this is a multicast key
  * @IWL_SEC_KEY_FLAG_SPP_AMSDU: SPP A-MSDU should be used
+ * @IWL_SEC_KEY_FLAG_CTRL_FRAME: key is used for CIP
  * @IWL_SEC_KEY_FLAG_ASSOC_ENC: use this key for (Re)Assoc Req/Resp encryption
  */
 enum iwl_sec_key_flags {
@@ -689,6 +690,7 @@ enum iwl_sec_key_flags {
 	IWL_SEC_KEY_FLAG_MFP		= 0x20,
 	IWL_SEC_KEY_FLAG_MCAST_KEY	= 0x40,
 	IWL_SEC_KEY_FLAG_SPP_AMSDU	= 0x80,
+	IWL_SEC_KEY_FLAG_CTRL_FRAME	= 0x100,
 	IWL_SEC_KEY_FLAG_ASSOC_ENC	= 0x200,
 };
 
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/key.c b/drivers/net/wireless/intel/iwlwifi/mld/key.c
index f2c87f830ba3..74b483783de8 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/key.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/key.c
@@ -19,6 +19,9 @@ static u32 iwl_mld_get_key_flags(struct iwl_mld *mld,
 	if (!pairwise)
 		flags |= IWL_SEC_KEY_FLAG_MCAST_KEY;
 
+	if (key->flags & IEEE80211_KEY_FLAG_CIP)
+		flags |= IWL_SEC_KEY_FLAG_CTRL_FRAME;
+
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_TKIP:
 		flags |= IWL_SEC_KEY_FLAG_CIPHER_TKIP;
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
index 898e376e2979..a7530e01f8c0 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
@@ -2211,6 +2211,21 @@ static int iwl_mld_set_key_add(struct iwl_mld *mld,
 	/* Will be set to 0 if added successfully */
 	key->hw_key_idx = STA_KEY_IDX_INVALID;
 
+	/*
+	 * In AP mode (i.e. when there is no STA and the key is used for TX),
+	 * simply do not install CIGTK but claim we did. Currently the FW will
+	 * never generate frames that would be protected with the CIGTK, so the
+	 * key does not need to be installed. However, these keys require HW
+	 * crypto so we must return success to mac80211.
+	 *
+	 * Note that if we start to install it, we will also need to update the
+	 * bcast/mcast stations to set the correct CIP MIC delays when stations
+	 * join/leave.
+	 */
+	if (!sta && !(key->flags & IEEE80211_KEY_FLAG_PAIRWISE) &&
+	    (key->flags & IEEE80211_KEY_FLAG_CIP))
+		return 0;
+
 	switch (key->cipher) {
 	case WLAN_CIPHER_SUITE_WEP40:
 	case WLAN_CIPHER_SUITE_WEP104:
-- 
2.34.1

