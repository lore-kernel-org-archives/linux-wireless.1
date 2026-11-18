Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992161;
	b=rDyMV0ou1CgbKZc0YNnWChkvwyoC5rPzDxOnosJORuM+clKbd+1MEY9J7WwkljMkIYZw
	 03v3eJ7MGoAP+o5z0CDGjsgZzUCli7gaXkln8lGctlMKMP2hC75cL2bhS3jMtPEiWmrBJ
	 bpQuZYAAfzObT2idyYy0j1XqMS2yXgS2eGOkfXXbvi+eIqY0FZIzf7YJedSj9ANA1TP6H
	 7QefyKirt7A0+yGvtEbY1MCymUD6hHwMn0DpTi0DMHCJm52WCbuDJDrWv0agAi25VVgxS
	 EHwwiiT9hH90si9G7hV2NvkeH//3ULKDR+RHZ/mdQOC1/jZO7XX18p392BByRx11CEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992161;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=3i6s1e8K1PAoRqZm00kGDrGJpVjlzh7ByiMCypxes2k=;
	b=lgM/Kug0mrTAsGK+taXR5SITSAjpKQn2Gbw3dSyhTFf8TLZOFyLgHiyuVotCYYNodDD6
	 Vm0y85D3pNDRfcUyYXvHEMLmrH+waYo7YDDbAlcQrjgs1MVmBcDShXyh1veBcgYPLHdEa
	 gjNBL50nY3D92MM4+rygkVHR4iZw6rOaMjHfWMQ6TDjOdQQa1q6trscm4xtZxLRFYrwEG
	 943GiswlU8PqPW75SSHufJO+SJzIVEHCJM1Su87ggEEMKrc0tCDQuLHCkHHtBJEZoAsJV
	 OX3lqYK4gIe5X8tTQe1K3DWo7SjuFNc/b9fxM1MJ1eb6GCBeQi0eG1sIsI5OcPbjhPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NA39CJOK;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A9A606A336
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1A9A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NA39CJOK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992161; x=1826528161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FINaOW1Pn5QgFcIAp0YoJRcr34JKOYIzwaYrxrcETuE=;
  b=NA39CJOKdtODWT9iQgcrcTTgT0pwNNeMDfplhGQ6CgVCTJAUEnKSWKQK
   tcirDUauy5NuRLLWmtIvMaxSmoQk7Z8/vn+m7ZbY9Z2ncoSU0wOz5pU/W
   pByVO8lLKtnX4BcOWx507gyGuXOjX/oOTf0OrL0JiF62hAGpRf0oXCyWR
   bTKH18KSzmJoAre8WNRiB9x62ygnhJBGAoIDd3VMNWQx3vlQ/bN2pwUbC
   VJia9ulQ1QQTWXdlIyEKjwtWi0G633/naqVL5YxfNbWlM/Rwi8v9s73+B
   XgI3TGLvZQpxo6No+FnUeEMn42vVucGouJAqwJu9Vp7sCZpyFDxvhoE9V
   Q==;
X-CSE-ConnectionGUID: qWw5SQE8RWm4FiJigbXzlw==
X-CSE-MsgGUID: YZRBCq6lSHav/QHHpfYWwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871950"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871950"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:01 -0800
X-CSE-ConnectionGUID: jR2VC5ZnQe+z0DVue0KVSA==
X-CSE-MsgGUID: pFHXRrgcQ5aEf9/nosakzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000227"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:55:59 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Ilan Peer <ilan.peer@intel.com>
Subject: [PATCH v2 iwlwifi-next 04/15] wifi: iwlwifi: mld: set cip_defer before association
Date: Wed, 18 Nov 2026 10:57:36 +0200
Message-Id: <20261118105612.7e1a780d013a.I0a412071ed632f81f9c5dda114b940128d893b14@changeid>
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

