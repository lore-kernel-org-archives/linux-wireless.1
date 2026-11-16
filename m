Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864103;
	b=B2VVdLG7qgaqk5bQlA4PaQoO/gO40K4Wazl9PYppZi33cxV2b+lgghv19TmccXzJkvR6
	 rlkrL8gjpzIQfjHtSWF1GyWjeIpF9Rt+wC9O4qorGItagzubiZAGEjZJpUDzvpylW6NeD
	 dP57oAhiLHCDL4ZHiMsB4rFeQcOZx3hS8o0+QY+52c786Hv1XtYp1o/waJgeR0ikRHNdk
	 s1kQRC87G3OFlqu8DMd1bdI07D3e1Z118imHkWWDJgiI/bOn4dkhUDIT/0EFdRu0orjCy
	 5P0Qqntvz6i+b93fadcVddv/Z8L9ygqvOSDR6eCbawEmP5DVYfabhNwbL53nYvIv/eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864103;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=mFbarUnT5Cth2Pm+/avfUF8Tapw+bzryQe20C1rCbTA=;
	b=BhO6oRf2EV42xynzTPks1pkElQtAnWQogZofecIuYcMfNaZ94JURQ257fBk2f7fzHSpG
	 deOpc/TbQth13d+sHy0DQkWLUhPwHg/5vFSFGxUPGqa46k6GkMGSd2YJ2/ig1iU0Ivt2N
	 GrQHnFmhCKB1lsvWIoHczNlnhGiUftHfKm5XZxFhZWpo8RxiMIync61r656DH54MvKKvG
	 CmOkMY79CNgIVLcqG92I8ZpCR2F6+rTwLm4aWx9z5CEqqzVBf2HLhurOKaQVL93b1womM
	 JS16O28Jotqzv8rPSGC8CFOmjbvqe079WZGBMO+aT5zxX9V2vnUXS2wdQ4ww/BJV7ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NlX6ulYm;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F79D606A338
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F79D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NlX6ulYm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864103; x=1826400103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bkaKhdVmG2wyQYFZbkVyHzY62D/FeosvELAUu8p1S4U=;
  b=NlX6ulYmA7few/jrvWM7alfIwu72BMtnJNVC31K7xHDpNX28sW1P6YXv
   h0kvaUJaQj3iMi6ZYBbSYAI5o7u8UDneNOtopphb4nFmWhp0XwJ7XfRnJ
   94v5J9W3UNyCm/GUTeecDd7JN5X5WlnEHTZhy5UOT3y6JQc8N61x89GfB
   Fhbaz296iMcc74pFe51jhiIrmnZNvP4WDDFXRy3S+0+sOEI3Na9UTX9Jd
   HXCpuZZpMu3or5mXRQUxDNQz3PUs5YHtJXJKGgHNvGwXIXjf94beChirH
   YCNFGnO7Ij1w/lZ+1p4vMuty/VIjzwf1uDOOgZrmr0fp7B2qvacjcQ3cO
   w==;
X-CSE-ConnectionGUID: uLMpx3yESE6lwpeQ6jxTgQ==
X-CSE-MsgGUID: 7rZzzCFlSIq0KdmHtfMaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604193"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604193"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:43 -0800
X-CSE-ConnectionGUID: 3ImZc8CJSZGC9zKL9odeEw==
X-CSE-MsgGUID: aI+oRLxfSqKwF+qwvZ0ZCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969089"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:42 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [PATCH iwlwifi-next 02/15] wifi: iwlwifi: mld: enable Control Integrity Protocol support
Date: Mon, 16 Nov 2026 23:23:20 +0200
Message-Id: <20261116232138.a0430f1079b6.Iefa46c4cd4ae5256f496ad4454898fb9f76da260@changeid>
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

