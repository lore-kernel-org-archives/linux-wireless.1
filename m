Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864117;
	b=ikOAl+SttHO4ni/epTIp15JokU+QbuoHlkwibyyGjEvhsNRGZMcI5ZQ+8dRb2ZE/p1oO
	 G6PF/x1z4BhuHfF961aE9V70xtEpYqOKijuRc04jdlKg+sEPCKw53vn93k0EdYZSdOpi1
	 aYh0B8bt2rNAY+jTtysQfZ0sfKYzO7ymZ+DmNCNYMdCwYh7xUa0bdXRkIqG/6Kfn3JjSE
	 XJmyI6DupefH0bSmbPjcA9qBQMz7iD+fpUyQlP+IoS6jC/Mbhyfsucl6L7MLEIJR3A8j+
	 orNppScKIR+y3AND5Ix4yzyAkujMx1vNKqqbSvk05OnlJnKKC3E3hAU10tMDA5KAMPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864117;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=wUfA2l5mxnlidUSI/TPmYmITOlEKBlef5NqpUXPMXbs=;
	b=A38koRYjgoVUVDdjGd3xg7r+8+3GZbY3tM9IlVNd3CsCBKFNm8mn8cJ9Bk1XbHvJGD2U
	 dEneBC+1aAeqL2oVDTCGl/1btp+tKDhQGqmvvGE1kPwOvoq7Toa+R8ePHgf0cGNlj+eZ5
	 UWhj+IkN0xT5LYi61w0KQFPdA9saseTD3inFSBZmcxSKRabX7HQWCqE50oROr9iRtZzxu
	 6KRsE2Fvr/hEIvLiyd+37utBn7t/8YBS5+tldDM6lTQJxawVuyScsSkPanpbbdN0GNMo7
	 Ww/mLnPqVx6saKm/9VARjeqycfDqoSzunY3YZ3JufomdVm8iA+bBAHFJbHasawPNCkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ajHuCNz0;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F07D606A32F
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F07D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ajHuCNz0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864117; x=1826400117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7EiUlabWlJ3y+O0QMgNvmsKHx2I9xyCelJzo4Iqmj7M=;
  b=ajHuCNz061GpfRj5MlV+qDwwy/czhNSxQczB1YIOP3SojYEEIyjq1Nml
   /n6RWx7aJuWTy47fOCQof0Hvnx5lkKe68U9TQdbUZV58tOJF7Rje/+S6M
   gqEOCR4zKeo180azQPin1PWlM1xW1F+zmcSRSsriqzaTGTttUViAbKG2+
   0oMDKed1T0bu0QJD2qc3zPRAsK9eai1o8NxUHRaHHVHqyyZE9hNvQ3XT2
   ATLfOm2OI/gLRAlCsKDADoBrSb1bAUulTaJ7XHWyvp/SbwBkk0Nls6v2C
   LVovoMckT/U9GbQhJ5vVgn9hy+Q1qFJds37z5Ty8biW68zkLp7NgsI5yq
   A==;
X-CSE-ConnectionGUID: csh+v6hMR4ifgA4aHM8dqQ==
X-CSE-MsgGUID: 8sLETzhmRHK7taX3LnkmXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604207"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604207"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:57 -0800
X-CSE-ConnectionGUID: nziua0XfRFe+phpdgU/SMQ==
X-CSE-MsgGUID: wgC8uh3XS8WHtsev8zdbIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969155"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:56 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH iwlwifi-next 12/15] wifi: iwlwifi: don't send sync host commands from atomic context
Date: Mon, 16 Nov 2026 23:23:30 +0200
Message-Id: <20261116232138.e1beaa292023.I608d9635a5c427a0ba9e427f609cd3529517cd5a@changeid>
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

Some time points are reached from atomic context, e.g. FW_RSP_OR_NOTIF,
TX_FAILED, FAKE_TX, and more.
The debug commands of a time point are always sent synchronously,
which means that we sleep in atomic contexts.

The reason we didn't have issues so far is probably because we never had
to send hcmds in those timepoints.

Simply send the hcmd asynchrounously.

Assisted-by: LLM
Fixes: 3ed34fbf9d3b ("iwlwifi: dbg_ini: support FW response/notification region type")
Reviewed-by: Johannes Berg <johannes.berg@intel.com>
Reviewed-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
index a64f958bbe5f..6636c21f3704 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
@@ -881,6 +881,7 @@ static void iwl_dbg_tlv_send_hcmds(struct iwl_fw_runtime *fwrt,
 		u16 hcmd_len = le32_to_cpu(node->tlv.length) - sizeof(*hcmd);
 		struct iwl_host_cmd cmd = {
 			.id = WIDE_ID(hcmd_data->group, hcmd_data->id),
+			.flags = CMD_ASYNC,
 			.len = { hcmd_len, },
 			.data = { hcmd_data->data, },
 		};
-- 
2.34.1

