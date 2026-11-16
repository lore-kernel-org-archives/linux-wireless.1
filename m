Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864102;
	b=JyVoR5OG8vfTMkUR7rUJGYHqdPZFQ/qOynG+sJ8hC1e14HmUD6WWwxniJkZveJTZo89W
	 5Hr2cdbsyq8zp/3jH/kFjBfA5V81cjAP2omN7QQMBS597cE9MVashf+ceTs3cOHXFnnPT
	 DPswRzv3nGPcWGe5xATdRwetlhfSDau+IgLDSb+7FW9kEKmPw5FriFQh2QIdrixLK0xjp
	 6MlTcuKSU9qAyIoznf4SUaWAKWmBXZMuwbneciHoCvtjSaQd7IUkT2FFDfCIXOSKNo1wE
	 XphjSBn/l4yOWYgCiFwXPiAFqZQpK1XAsqE0KIafk98GnXAg6Yfc9Sh3xyRye5k6kfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864102;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=PF77GFZZQLgW8SSIuGTEHPXjSiEdeZ1lsERACIemzjM=;
	b=K/GP6P9dGoFV8J2aF9asavCKb+nJUNRELcTPQ1E1232fMzV/Gksl3p8JVcac4VRyWS5k
	 Pp7O7vgzt/uyinqjl1mfzBTrW9eaI93ZBOzb1lL8y4dY5TRqqzv8CfgbyvcdY4fAnRqph
	 98VFI6IufBvMWKWwGtmAWqY7GndVfIEA/UM+bC727qNy+yUdUFdco1UaF3BJlLxJaWnze
	 vFfcegPvRE6fZH9R9xymZZRbB4r/dqj6g/y8JHeLitYfwWCL3WDmHpFKa3RDV+OUwysLa
	 cwK1GTtlMJcNWeDmuBqrad5B8L+k5vw3XO5M+9+crB9L9G5e5bwM8rfRsV2AYaGkQwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oII3p6EA;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2924E606A32F
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2924E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oII3p6EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864102; x=1826400102;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b14suSaJw7B4n3srolU0W5rOkcGhYwE6s5xPf5fyFwM=;
  b=oII3p6EAFumjIke7FmpdrzCw1Cs8H9jyg/sIvVHAYtmTbnC7QPfYlwkt
   EtIgIOYpYDdhFAztbylNCi739Dyt3kEThGf88W6NWugmEzjRPEOGsBFJ6
   4CMX0+yRwSpFRnAlukAkiFUKcCrTyu6317OVx+e6TLEkYQVJVwwPiGcZj
   9L60SVvXil3UYo2kOK9zdJ5agNOPyCDXZE4/yiyAaLrG/ay7e3nKQTBPk
   OilsuwNmQxDy4w+MXkE3dfjb2IWGMFASF5cLjOtb66tfqC05RLKRnaGSt
   8rEhJGswMtYllL81rFazg2opXdTymtt6zDt5u8GQ+cUTKD2wIpbJ1DbrW
   Q==;
X-CSE-ConnectionGUID: Dvblze4IQTCAhC6qAZWWPg==
X-CSE-MsgGUID: 4lFmGBc+QFGFKb5f9W9BYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604183"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604183"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:41 -0800
X-CSE-ConnectionGUID: /gZ+gchRRMWtBtizCTX0uQ==
X-CSE-MsgGUID: /uzdUrtJSsmpdA3eHdLHKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969075"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:40 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH iwlwifi-next 01/15] wifi: iwlwifi: mld: handle CIP key installation
Date: Mon, 16 Nov 2026 23:23:19 +0200
Message-Id: <20261116232138.cc268a50f45d.If45c315ae6b9e1b221c2dc042ef29f9c42a34108@changeid>
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

