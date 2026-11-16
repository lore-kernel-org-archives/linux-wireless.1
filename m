Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864106;
	b=vF2ffagAyBLwF+Z8Ii8ZG9Ot1/LWK9ojOu+xP+U6F4dIQauBOVLysLBJd8b0TE7TwW3J
	 v2ZNYRTtzhMkrYu7UnRCKJs0N2T4OifDNAqoyxKgl/t89KLMBN5ILGCRrsSGl5pzC6Q6s
	 mCGyfYQxefqdpxjvarz/CzlELh0ZDnkwYKcx3JNaXpqfKVmiHPwPu1X28d7wetTd1qZF4
	 rr7xMXlVJTpT7DscYED28PqzvkNMiNvnd1byAMfIeuo5iSzV4jAL8W78g2L+GGEWeRIUc
	 8pBpcQH1wWsyt5N0j8X0LT+eCKRsYfL1CEz2uOxse74moaJPx1KjVW4QStNzt9Kuhrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864106;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=3i6s1e8K1PAoRqZm00kGDrGJpVjlzh7ByiMCypxes2k=;
	b=YknmJ64MvvvljdfbgmrS1Dljl1IajJR8eqqPhkjHa+wZeG5nJVCMiHdEyy/XN9ONEgjW
	 ATdOUv/rVQystw7G8en0qaJ2hqIeIYy2k2yat9GoY2Ft3laAb/Um7xZPXKZcfdTreWrWW
	 nbjkmEcyQHlCA0ZlKLPvNHZ2tSXqItmfDHCZozbMWYbIeYOkIX6tULoETaMoFqXfrl3uG
	 Oc8TtFeiOKpTrX75T2JiwBqn0jqTfocOXCZ3R48xhoaBF491oSodxvfiRqDNsWcvv5gqa
	 FTuQBHUT0OSZ14U4xkolfC2xQrDnRAWP1kJVicM0dt+T7s1TACs4von4U1hRhQQSVwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEtFHgBW;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C5A606A882
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C5A606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEtFHgBW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864106; x=1826400106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FINaOW1Pn5QgFcIAp0YoJRcr34JKOYIzwaYrxrcETuE=;
  b=ZEtFHgBWBfU9elecSRq93bGTxRQGQTZFbZcNZWAxUjJjaFhAek0dxWVP
   BnOj8cNh+1U2HRSzkMuj54YsSKCGBty4k0dTnUuhdNT1NkWv5JaFs/Rkr
   hwGGe6lSajheSXqN7PzycHXZ3BKoJG2IPi+zv2trkfakorQSSaVMTxUR2
   h8qjWQ5wCqKF9pu8ti16fUEz2MTxnT3MHKeKuqFrCDEYLJC0tmKeKc0Uo
   dDrVvt4E9iO1oG4gWcP7zvKyPzlC1+kxu9fzDpYAY0KwGIBYSOiLoLH+1
   JHDdWemkS8abJG27gTc1dg6lOSgdEZmqlZ4KjW9x4amk++G1jAZPjtL9K
   A==;
X-CSE-ConnectionGUID: vInEa34qTeqfkOkQDvoVTg==
X-CSE-MsgGUID: g2wNSEqoTeOEYq8fx+qXMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604196"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:46 -0800
X-CSE-ConnectionGUID: OOYc+jOYSkSvs5IFemJR1Q==
X-CSE-MsgGUID: AGgqr3W4ST62I0FixUNVfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969108"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:45 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Ilan Peer <ilan.peer@intel.com>
Subject: [PATCH iwlwifi-next 04/15] wifi: iwlwifi: mld: set cip_defer before association
Date: Mon, 16 Nov 2026 23:23:22 +0200
Message-Id: <20261116232138.7e1a780d013a.I0a412071ed632f81f9c5dda114b940128d893b14@changeid>
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

With EPP, user space installs the unicast key before the station is
associated so that the association frames can be protected.
Since the control frame protection parameters (mic_compute_pad_delay/
mic_prep_pad_delay) are determined during the association itself,
the firmware must not use that key for unicast control frames until
we are associated. Till then, set cip_defer.
Clear the field when iwl_mld_add_modify_sta_cmd() will be called
again upon association.

Assisted-by: LLM
Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Reviewed-by: Ilan Peer <ilan.peer@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/sta.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/sta.c b/drivers/net/wireless/intel/iwlwifi/mld/sta.c
index d66b1164b8e2..745f26dfcb54 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/sta.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/sta.c
@@ -439,6 +439,10 @@ static int iwl_mld_send_sta_cmd(struct iwl_mld *mld,
 		return -EINVAL;
 	}
 
+	/* cip_defer overlaps trig_rnd_alloc of older versions */
+	if (cmd_ver < 4)
+		cmd->cip_defer = 0;
+
 	ret = iwl_mld_send_cmd_pdu(mld, cmd_id, cmd, len);
 	if (ret)
 		IWL_ERR(mld, "STA_CONFIG_CMD send failed, ret=0x%x\n", ret);
@@ -521,6 +525,14 @@ int iwl_mld_add_modify_sta_cmd(struct iwl_mld *mld,
 			cmd.mic_compute_pad_delay = cmd.mic_prep_pad_delay;
 	}
 
+	/* In case of EPP connection, tell the FW to defer unicast
+	 * control frame protection until we are associated, as the
+	 * control frame protection parameters are only negotiated
+	 * during association.
+	 */
+	cmd.cip_defer = sta->epp_peer &&
+		mld_sta->sta_state < IEEE80211_STA_ASSOC;
+
 	switch (link_sta->rx_nss) {
 	case 1:
 		cmd.mimo = cpu_to_le32(0);
-- 
2.34.1

