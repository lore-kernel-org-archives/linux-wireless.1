Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677407;
	b=WPa91gxDe9476ecIDmtaHLJ3rsSDe2S3I691aXhR1Nk/qixhK/2eqm6DuzeO6f+mPUxG
	 AXr6Z4/NdbnGhx3aJCU51rMPq4hd/JVLiUax2+uPuASUOC6iYk2pTEQX/+OVUFuTgAZKR
	 7CDveq6T7Scpt+hM8TSw2T6SIkA6oDjhJqeqKzk5Ni3S7zUG9XgNJdZNzgxa4HzN60Fdq
	 DLzk5M30WXp05ReC4wQbS6YNto7fX+DxdxuQO8TBTuX/ZFMhr1Em6cO7hAt+CWRgXrfFH
	 smDkhj+hQabIojC+rdiLIeI07EVxrsPb+3RLUSrNnVLyDAL50X6Q4MwljJCcWDtPDVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677407;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=dZS3XYkEujLQKpcsktUIlUdVfV86EqLgWk+nVdlRmRg=;
	b=Qiy9UcemqzAffX1hEaJnV6IvlXmBvAbRm7tb30sQZt+Rkm5hhTBDDjMq/h5xT/WpiN4O
	 TD+ME9bDy7Y/3k5K1n1t5RFXkR5SNPyVYCZHB/IF9jxsKnOOKk4k4FUixoL6qqklII6wT
	 W2XTEOlp2DHlDqUje/ayIzYr+JUBpdBqS8WHGj8CQg5FkJh2RN6VmhTesRTUhKlcuxbxX
	 iakM6PJw2sIB8of2hcNt2wQIpJaaCIQzSqE9yxUZtMSS0HbS754paoFCJ4CeOrq8YiGXH
	 YPNUeS4USop7ms5IJ0Vz7tw+oiytbao9FfpPgC6NIhGG7qdjdrbwF/gdb2Wckz8MNMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jtT4eBp8;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA626606A885
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 17:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA626606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jtT4eBp8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794677406; x=1826213406;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HMM+RFBciKYhRYoU6Od8ydF1zWt80VhbMKHQBcX4Nlw=;
  b=jtT4eBp89lFfrK8+Ef7pk7st7wnUbkfiuojg2kh1tCJyCs7yMZTr43x2
   P1PZQOlR0GFAcZSUmxJ/OKXANP7r5cTjXVzm5d84wYHzgqHggD4spkDB0
   Kv87NBySaRnaetTmswempE5f2OkrXYNmXJgD80z07ItOpwYqlER5+PUco
   mfO7IasrU7TpDUa8x6UDn8G7D1RtyLLBARiCnBd0fhX759/3orwgejz3p
   hBmE3eVIPyOvumFMDs1YvtUOAbxBd/TEO6/P0uPNpfBeL5oicBocJvNA5
   l4iGe1nPeWJBYYkmAAtuyFMH0o7sYShDwjfRMcx2EMw3o+3t9OcHci8kA
   Q==;
X-CSE-ConnectionGUID: jyVgQ0EQRoSux/WVSvw0ag==
X-CSE-MsgGUID: QqbkTmSGREuPizu0YHTfVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3498801"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3498801"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 09:30:05 -0800
X-CSE-ConnectionGUID: IQcgtvcSRo2YPxvuRlmROA==
X-CSE-MsgGUID: 6ijmFmaARrOmrYW8ygHrgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10897009"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 09:30:04 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: [PATCH iwlwifi-fixes] wifi: iwlwifi: mvm: correctly check the API version
Date: Sat, 14 Nov 2026 19:31:58 +0200
Message-Id: <20261114193144.ab54bc9717fc.I8cda260e2ef7aedd790915a17cb6832010f82aa4@changeid>
X-Mailer: git-send-email 2.34.1
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

The check for the firmware version for the reset handshake
was wrong. mvm->fw->ucode_ver is the major number itself.
No need to mask it with IWL_UCODE_MAJOR.

We could look at the major number from IWL_UCODE_TLV_FW_VERSION
but we don't remember that number and looking at fw->ucode_ver
is good enough.

Fixes: 0eaa1f245ac0 ("wifi: iwlwifi: mvm: don't support the reset handshake for old firmwares")
Reported-and-tested-by: Chris Bainbridge <chris.bainbridge@gmail.com>
Link: https://lore.kernel.org/linux-wireless/amzVtgQb2p-_nShU@debian.local/
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
index 183251457361..3d35c922706f 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
@@ -1412,15 +1412,13 @@ iwl_op_mode_mvm_start(struct iwl_trans *trans, const struct iwl_rf_cfg *cfg,
 		 sizeof(mvm->hw->wiphy->fw_version),
 		 "%.31s", fw->fw_version);
 
-	trans->conf.fw_reset_handshake =
-		fw_has_capa(&mvm->fw->ucode_capa,
-			    IWL_UCODE_TLV_CAPA_FW_RESET_HANDSHAKE);
-
-	/* Those firmware versions claim to support the fw_reset_handshake
+	/* Some firmware versions claim to support the fw_reset_handshake
 	 * but they are buggy.
 	 */
-	if (IWL_UCODE_MAJOR(mvm->fw->ucode_ver) <= 77)
-		trans->conf.fw_reset_handshake = false;
+	trans->conf.fw_reset_handshake =
+		fw_has_capa(&mvm->fw->ucode_capa,
+			    IWL_UCODE_TLV_CAPA_FW_RESET_HANDSHAKE) &&
+		mvm->fw->ucode_ver > 77;
 
 	trans->conf.queue_alloc_cmd_ver =
 		iwl_fw_lookup_cmd_ver(mvm->fw,
-- 
2.34.1

