Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992168;
	b=mz8OGOA9Aliqc5YO3Dz9VQ2wF54agxD3gQGMV039QmtF7wakaR8g+QtzKk6vmmEukp0S
	 BVQz3FqN7OUNGjXlpSeacOhWjM0USJ/A9JYZn0ZabM/pyEY9n/k1wa3Lnmz8MY+Bi802W
	 Ky0BcLGDcx2Jnuo05QdErQ+B/q55uta7wXB30zaFkiCqzWSowYtIru4cy/j2sAgg5o+4T
	 +t0GxjcKg5o952lpDfPDpaWigQQQxb/+v7dAJAASnb4dc5YMQOURa5cA+TmsRyuUgaAHw
	 gbOmBwIjj/HSXSrKPfMHx2yNpBM8+Ased656wywz5yc3E7TWGZzmxIkHx341QVIUQ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992168;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=ybdLUqKdszrwyYEI+iwbYGbbPY7V0ia+cBPHoh5qc8c=;
	b=MxK9zYcwgWIdS/nmN4ENMMu7NgQtHkZo2ZeSJahnT0xvrIr6AaC+KizQjPOQUftQbOsB
	 X1wNzn0PCctTUKJkBZmC9oWGqIxMzl/IIiE2NI10vAhYk13ghFf9tf5SWmP0saUJOnGJA
	 PncKcSiIDAsyO/67pkkyTjVdgfzAPThZmCrEqtqd8k93SJ81gg/NsQDbIU/bX8LQkX7JU
	 oS5/whqUMrtC13JImLx0ADT7Vv6KO5juBq0brNKR0jLfQr01F4Z6Wvjw7MYlXTMslJIx4
	 PpU2IsJdOML/WmGZo9+gMBt8aUSdlgpNRMwm9JxrtrultZAy2Mo/DeuIAZgTi9EWpaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GV98C1pS;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECEB606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ECEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GV98C1pS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992169; x=1826528169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D5HYI6q/gcc+pqVCahBm7U1ysyrORxAJmVuaPsfeZ7I=;
  b=GV98C1pSR5wxHL59a8D6Jf8pZ+cz9o72vwCe7nvt0NZx+HIH/8zvbT4M
   c0SKiVbpssrHL54iPLg0cldKSQzu5hk46WQ+ANo0HpgOaf7a7wQH2YPEQ
   T1EGss2Iy1ZzW4AX/edOoL3sJcqxbIUjyvJQOzDFkVlm8q+fhUKvkJzmp
   tmeX7e0n/62F+KGSCI6Jdq/ylXjImgkDpBAFzwuMkPb3e5owah3XmSEO/
   iqXg0gAKcvy9rrQp5VkfA3Zag1uyXZCl4vmCxPV6xEc0r5K9VvFmDcXpK
   L5uCHKP8wFXsREvN8ZD6bYKHnv4v7hh0vDUnkNtGfVZ3KVQdvcqIZtFVE
   Q==;
X-CSE-ConnectionGUID: U8RWX3XiT06cY38mhuaMbw==
X-CSE-MsgGUID: lz13CVn7SdKku4ti3fKWOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871959"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871959"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:09 -0800
X-CSE-ConnectionGUID: COooeip7RMm4DtsLK9NlUQ==
X-CSE-MsgGUID: Ybp094PKRhiZZUurSz8rQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000302"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:07 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH v2 iwlwifi-next 09/15] wifi: iwlwifi: stop the firmware completely after the reset handshake
Date: Wed, 18 Nov 2026 10:57:41 +0200
Message-Id: <20261118105612.d0e3a279d7b9.I9a6d783fd36b96638452fb32d0964c24d10bfd3b@changeid>
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

