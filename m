Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992158;
	b=t/47eDG349rTHu2bHDQBMtlXSEQiqGnhbqNt/yCcaNXCQ5t9QxCJ8DlJfwW96L/+ll5N
	 4OxTnKoxQXE5LdoDBDG5ZhVQ6vBfyQ+HBS+/sSG3wf+jrTgagag24snVSIqQRxzWTtdx2
	 uABSTGIlZoWOMEAPXA9KHGYV6942Qonx5D1815ZWluTEG4UybmIC/ZJxMm2TnXeVx8jtt
	 QBp0hWjHWgNLKV68gaU7JK4i3lQTB+eUJUxvCbgD3j5RJttgWxJPKoZHULV5Ist7Itrre
	 bM0C3tCEvD2G9axnwNP6ejyIoI5IEIGu86LRxea76FKPKaXfrK0Au2HnVtdHpAiamug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992158;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=mFbarUnT5Cth2Pm+/avfUF8Tapw+bzryQe20C1rCbTA=;
	b=OzCT7JNeSVmihIBK28/dLfIP8KwVs71sQZ8M0E7or7HKtE5+5/Y0YrxwnRvNwexD/x6G
	 VSNRMu72z7cl5FEgRKYK5I579bqKiZwvgcwhHDIUdKjH1Sp60hWQBOIhOnkHV3xbUCqv0
	 tWM5Ju96YLC29XaDfq7sbpSEETmseCYBxrzRDWBllOVUkjYsQiAQKGeJA6IZxcvMJ5N9C
	 kWyeCHHjcNgidGZaVyY7UjsfklWppzVZ6YR9OjHKhHtJHx1woPrzxRX647x78DsVDs62h
	 dYeesQFntzrI6kC0MdNpG4I9cBRgY3Iey/lejKWbW0m7s8BMqsMXn8XKU7CGKZw+mBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g4A+d+HO;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE72C606A33B
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE72C606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g4A+d+HO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992158; x=1826528158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bkaKhdVmG2wyQYFZbkVyHzY62D/FeosvELAUu8p1S4U=;
  b=g4A+d+HOIBBC4uCOmFnPNd8XuuYyI+xX3VCBzPFbg+unve1y/IKWd3Ya
   5jkVbsoz7DjFiCoYc/thr1JoJMyP/1mSYN+0I3B2QLg685j9tGsflt+e7
   n94SFC8J4X+IEmdgK9eTFFlcVPijPvoU8h22AGU3dHcfXE7pqIjuY0aei
   tEMevc02rDw0AcaWJ5qxWPp+QFtBSE8/T7wRUpZoBynghgrkp+aUCO23f
   LqKz2ktuAYDHLt3prA0Xl916BbcArR26WHd4l4RA/zSm76TXiFSH3FB3M
   1mykfRERMtQRDDYXgjpeDNkpQTsSglS3V7zgY9A20Y8+YF4A811j40vHH
   w==;
X-CSE-ConnectionGUID: h8LGbmWOQKebYwcNDkaimw==
X-CSE-MsgGUID: m1weJZvIToi/M4/p7j+ASA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871947"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:55:58 -0800
X-CSE-ConnectionGUID: JtThBv2VTj+4PtRXY/46CQ==
X-CSE-MsgGUID: dkxhLWJRRIubnzo3PLJV8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000185"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:55:56 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH v2 iwlwifi-next 02/15] wifi: iwlwifi: mld: enable Control Integrity Protocol support
Date: Wed, 18 Nov 2026 10:57:34 +0200
Message-Id: <20261118105612.a0430f1079b6.Iefa46c4cd4ae5256f496ad4454898fb9f76da260@changeid>
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

On new enough hardware, the feature can be enabled. However, it is not
yet fully supported so hide it behind a debug configuration. Also add an
option to tell the firmware to use UHR trigger frames (which can be
protected) instead of RTS for the initial Control frames (IFS).

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 .../net/wireless/intel/iwlwifi/mld/mac80211.c   | 17 +++++++++++++++++
 drivers/net/wireless/intel/iwlwifi/mld/sta.c    | 12 ++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
index a7530e01f8c0..821cd2d2a73b 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
@@ -304,6 +304,18 @@ static void iwl_mld_hw_set_nan(struct iwl_mld *mld)
 	hw->wiphy->nan_capa.phy.he = mld->nvm_data->nan_phy_capa.he;
 }
 
+static bool iwl_mld_is_cip_supported(struct iwl_mld *mld)
+{
+	if (CSR_HW_RFID_TYPE(mld->trans->info.hw_rf_id) != IWL_CFG_RF_TYPE_PE)
+		return false;
+
+	/*
+	 * There is no D3 rekey support for the CIGTK,
+	 * this can be enabled once the firmware fully supports the feature.
+	 */
+	return false;
+}
+
 static void iwl_mac_hw_set_wiphy(struct iwl_mld *mld)
 {
 	struct ieee80211_hw *hw = mld->hw;
@@ -432,6 +444,11 @@ static void iwl_mac_hw_set_wiphy(struct iwl_mld *mld)
 	mld->ext_capab[0].ext_mld_capa_and_ops =
 		IEEE80211_UHR_ML_EXT_MLD_CAPA_ML_PM;
 
+	if (iwl_mld_is_cip_supported(mld)) {
+		/* The hardware does not need any delays */
+		mld->ext_capab[0].cip_supported = true;
+		mld->ext_capab[0].cip_capabilities = 0;
+	}
 }
 
 static void iwl_mac_hw_set_misc(struct iwl_mld *mld)
diff --git a/drivers/net/wireless/intel/iwlwifi/mld/sta.c b/drivers/net/wireless/intel/iwlwifi/mld/sta.c
index 6122a7dab811..cfdf7c1baaaf 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/sta.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/sta.c
@@ -509,6 +509,18 @@ int iwl_mld_add_modify_sta_cmd(struct iwl_mld *mld,
 	if (sta->mfp || mld_sta->sta_state < IEEE80211_STA_AUTHORIZED)
 		cmd.mfp = cpu_to_le32(1);
 
+	if (sta->cip) {
+		/* Always add padding when soliciting protected frames */
+		cmd.mic_prep_pad_delay =
+			u8_get_bits(link_sta->cip_cap,
+				    IEEE80211_CIP_CAP_MIC_PADDING);
+
+		/* But skip adding it inside our own protected frames */
+		if (!(link_sta->cip_cap &
+		      IEEE80211_CIP_CAP_PROTECTED_CTRL_FRAME_ONLY))
+			cmd.mic_compute_pad_delay = cmd.mic_prep_pad_delay;
+	}
+
 	switch (link_sta->rx_nss) {
 	case 1:
 		cmd.mimo = cpu_to_le32(0);
-- 
2.34.1

