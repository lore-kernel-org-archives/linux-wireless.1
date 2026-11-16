Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864113;
	b=AR/CdPyf3grDzzHWkgKzFQhtFE5bQsooST9i4NBAOGkB/UMdKv8OxueGNnGrUYpaDxqC
	 b0BDuLysXv70kRjIvUq3XBYxQFz5snNQbY09iLq6NSpAyIqJv+r6gYVIhVi9czrR8fF+V
	 d622bPwNP81d9yn6AKG46mbViatqzDCv+qR8fHaBi6h7Vns8s9OUp+v8kcSqJVCeKdP7Y
	 T/sEhgG3Tf0u+brfD5/Ji1mST6XxQUGWZYCqZxEMHX+2NOthVT2ezSN0Cm+4+tYLxJvmN
	 LWnzElT7/PGXLO6cdvDrPp0MMZF/XilkYY7rel46jZl36Y+GoVlY6Ww3K84FtgzmzLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864113;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=ybdLUqKdszrwyYEI+iwbYGbbPY7V0ia+cBPHoh5qc8c=;
	b=jivGkS5YuiUM8coVBFSDdNOOhtCfX2nK4cTnOKkF+SohzCvlIHD5pLbIPtRd3KINAdlO
	 JJkrys+AV3uVN06KaaeERzLw/tgsuKi2G96kYxOrkg28fli/ja35MKpnO5bdbNFibwPbi
	 cWirtTGfwQU9kG3OxrM/FiUJks5koYKDzUjmrzlpbN6UQPHwlzXB5DhIQZ6cyCzz5mdar
	 IZbwlU5z1FEuhTycW3zvc5Ynck4UUr6qETZTQcgaJUr/d2q9Jjz9bQ2c7w5Kk+mnPZRc6
	 eICWRaph0nHau4uKbaNIHbMTBkLcvPOUqblLDgz/2k1JbNfBOzLY1exLHsE1vpBgSrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwazVL9C;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C026606A322
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C026606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MwazVL9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864113; x=1826400113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D5HYI6q/gcc+pqVCahBm7U1ysyrORxAJmVuaPsfeZ7I=;
  b=MwazVL9CkPbib5DkUUG1yk8rryC5+FL9SvEasS4jjL1+kXreWjFZ8W9C
   A8ddbAUAeiVprEKdxEuwpdczg8HlLyoCotvVbyJKI+ZFAOPNgVET1J+sN
   H55ZD946goghRt7LqYKH7Ho2B4VDRtoWh8H3nn7a8z9qJnWEaO0tHOpsq
   7ha59m7y6y3BNYiIGVZzTMiPHrOpkiZTGMtze00WoPUyTgpABoKUdy2GC
   99ZvlFJZ55H2eXR4uq+y4twsqxs3Xnzo0Ipio/75/xD4y/wGGLMLv2ClN
   VC4dIECZ22CmmnXsF1aOPAS0iO7jq2YhX53sqUcB/qkKSM8WUDKzVUrwQ
   w==;
X-CSE-ConnectionGUID: WBxzWASzQ3yflfXcLiUgbg==
X-CSE-MsgGUID: e5WMR6pSSee8v6K0hsxQbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604201"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604201"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:53 -0800
X-CSE-ConnectionGUID: T4dhR8gPQ7+epjjsAMiNDg==
X-CSE-MsgGUID: fxkNTNtkQDqrutFsYLXreg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969141"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:52 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH iwlwifi-next 09/15] wifi: iwlwifi: stop the firmware completely after the reset handshake
Date: Mon, 16 Nov 2026 23:23:27 +0200
Message-Id: <20261116232138.d0e3a279d7b9.I9a6d783fd36b96638452fb32d0964c24d10bfd3b@changeid>
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

The firmware dump in SC/WH was not complete, we couldn't dump the DCCMs
of the device's CPUs. It turns out we were missing a part that stops the
UMAC completely to unlock the access to the DCCM and that this is needed
starting from AX210 (even though the bug was not seen on this device).

We did stop the UMAC when we dumped the DRAM_IMR section, but the latest
firmware versions don't ask to dump the DRAM_IMR which is maybe why this
bug is seen on SC/WH only.

Add the write to the UREG_CHICK register to stop the UMAC completely as
part of the firmware reset handshake which is run upon firmware dump and
upon stop_device() as well.

Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c b/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c
index dce6043fe962..ebd7d5b5a6d0 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/trans-gen2.c
@@ -147,6 +147,9 @@ _iwl_trans_pcie_fw_reset_handshake(struct iwl_trans *trans,
 	}
 
 	trans_pcie->fw_reset_state = FW_RESET_IDLE;
+	if (trans->mac_cfg->device_family >= IWL_DEVICE_FAMILY_AX210)
+		iwl_trans_set_bits_prph(trans, IMR_UREG_CHICK,
+					IMR_UREG_CHICK_HALT_UMAC_PERMANENTLY_MSK);
 }
 
 void iwl_trans_pcie_fw_reset_handshake(struct iwl_trans *trans)
-- 
2.34.1

