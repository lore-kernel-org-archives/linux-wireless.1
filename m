Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992156;
	b=pNBUF1GKWRfXarGQwZV5fcqQMljitj57CzoeM0wOu6di7iF3ZCrqACyfcBg6azqjOmuA
	 RDCSCyzOr8mvWdxKYHdw4n3sa0WX/O0Xy6G2Q47g+b8f9xkclxs3YA6YHwuD7qIEwR7mh
	 pdG7DW2GCpvM+aM/bcKSFAMyMEJmfbiVEyhTLF/E6CQ5mOi5Zh+lLAxgVH9cHQyt1BkPe
	 norE6MM0PEdf+6l9vTK6WWtl1evAOK3kjqXlLZ5JKxArbkZ8ac1s/OjZl5Nulq7/pgKWc
	 pegvINYnYxRx348MGiCjABJp6NzzXOPzU5ndG3XZgKlDvWcLIGygr3xkePgENZJsPDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992156;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=gaU4V5QT2XafotkQ4bGWfJ1U/5AAyiLVaqJmVjhEYXs=;
	b=N+Xu/DaK87nih1/oo4SYBBiENPUgR3ACLnhl88NXMv3d6e2InoSqT8zaEuQfNfDznJr3
	 I4N+Nqf2IXd08vFwSSoN1wQurdMXu5/dzrY+hgKegjfPzNthR17YHPqSVUvuLIt6dC8Ha
	 r1PKw8vJ+H2fGaloR3cCU2JGLoCqekSrhWpprD6YaRcALu3WEGs2I3/atyO9yeXlHTVL7
	 Idhtkfh3YXRZ0VfYq2RNAHfrDHLAMuS4rZKNXFGnS2HKI+oZxXpJGiwy1QLfObbwMcP1r
	 LVssTttGdiC6rrcRyQso9TzkVnBDN+rn259ru5qnD4WreYWx4MQFoGhQ9avWI95gfIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1MWfRlZ;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17974606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17974606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1MWfRlZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992156; x=1826528156;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=roOiGzKbJnNzWQWvM0JQZNAi8GyiRoQFVNx4StucNYs=;
  b=E1MWfRlZ1s+L7dk039QDdhj8c+neFb8feL/BBl8DGBpRzHJoPYhfnfp4
   4ZLsGSe3ynn8UqvOEyg6G3z8Gmx2AJ38lIPuTKj2SQFCLqTMRK+xnhvND
   7YpdF40TvGUgFIGkB8xEn8T0gwmoirIYWdg7R8IJDoO92RxWtF4CYyVdp
   Vx41hsJFHfFSLWT5zgg6nEz95K9JZHhjgd9qL2USybrkxJYuiBtQkjJkP
   gxRT3wwbGebdZtOkIyMQh0Rwh8+t4LQ6bkPja2p0yW6EZ5OZfAMq32C3e
   TZU7gRnJh7ptJ9lkrPC0hRrJK+XFropsHZmaytDzWOm8xl2NM77qOteJD
   w==;
X-CSE-ConnectionGUID: z/kWaWwvSeSTJ/KO0ASssw==
X-CSE-MsgGUID: Wv9dWz3wTjae5Bs3/7YTlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871943"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871943"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:55:55 -0800
X-CSE-ConnectionGUID: sDp8jyVKSnaKJ/+u6TJwNA==
X-CSE-MsgGUID: ffku2CWERkeUmgJTpL6AXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000171"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:55:53 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2 iwlwifi-next 00/15] wifi: iwlwifi: updates - 2026-11-16
Date: Wed, 18 Nov 2026 10:57:32 +0200
Message-Id: <20261118085747.3845425-1-miriam.rachel.korenblit@intel.com>
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

Hi,
Usual features, fixes and cleanups from our internal tree.

Thanks,
Miri
---

Benjamin Berg (2):
  wifi: iwlwifi: mld: handle CIP key installation
  wifi: iwlwifi: mld: enable Control Integrity Protocol support

Emmanuel Grumbach (3):
  wifi: iwlwifi: mld: set cip_defer before association
  wifi: iwlwifi: mld: support CIGTK rekey in D3
  wifi: iwlwifi: stop the firmware completely after the reset handshake

Johannes Berg (2):
  wifi: iwlwifi: mld: request per-STA GTKs for the AP
  wifi: iwlwifi: partially enable context analysis

Miri Korenblit (6):
  wifi: iwlwifi: rename IWL_MAX_CMD_TBS_PER_TFD
  wifi: iwlwifi: mld: dump the FW error logs from dump_error
  wifi: iwlwifi: dbg: rename the time point sync argument
  wifi: iwlwifi: don't send sync host commands from atomic context
  wifi: iwlwifi: mld: PHC: don't read GP2 under the PTP spinlock
  wifi: iwlwifi: mld: take the PTP lock for the monitor timestamp

Pagadala Yesu Anjaneyulu (2):
  wifi: iwlwifi: move UEFI GUID lock status to transport
  wifi: iwlwifi: add PDGC platform config reader

 drivers/net/wireless/intel/iwlwifi/Makefile   |   2 +
 drivers/net/wireless/intel/iwlwifi/fw/acpi.c  |  43 ++++-
 drivers/net/wireless/intel/iwlwifi/fw/acpi.h  |  16 +-
 .../wireless/intel/iwlwifi/fw/api/datapath.h  |   2 +
 .../net/wireless/intel/iwlwifi/fw/dbg-old.c   |   3 +
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c   |  21 +++
 drivers/net/wireless/intel/iwlwifi/fw/init.c  |   2 -
 .../wireless/intel/iwlwifi/fw/notif-wait.c    |   7 +-
 .../wireless/intel/iwlwifi/fw/notif-wait.h    |  20 ++-
 .../wireless/intel/iwlwifi/fw/regulatory.c    |  28 +++-
 .../wireless/intel/iwlwifi/fw/regulatory.h    |   4 +-
 .../net/wireless/intel/iwlwifi/fw/runtime.h   |   4 -
 drivers/net/wireless/intel/iwlwifi/fw/uefi.c  |  52 ++++--
 drivers/net/wireless/intel/iwlwifi/fw/uefi.h  |  22 ++-
 .../net/wireless/intel/iwlwifi/iwl-dbg-tlv.c  |  22 ++-
 .../net/wireless/intel/iwlwifi/iwl-dbg-tlv.h  |   2 +-
 .../intel/iwlwifi/iwl-devtrace-iwlwifi.h      |   4 +-
 .../wireless/intel/iwlwifi/iwl-nvm-parse.c    |   3 +
 .../net/wireless/intel/iwlwifi/iwl-trans.c    |  10 +-
 .../net/wireless/intel/iwlwifi/iwl-trans.h    |  38 +++--
 drivers/net/wireless/intel/iwlwifi/mld/d3.c   | 158 +++++++++++-------
 drivers/net/wireless/intel/iwlwifi/mld/key.c  |  49 +-----
 drivers/net/wireless/intel/iwlwifi/mld/key.h  |   6 +-
 .../net/wireless/intel/iwlwifi/mld/mac80211.c |  44 +++--
 drivers/net/wireless/intel/iwlwifi/mld/mld.c  |  21 ++-
 drivers/net/wireless/intel/iwlwifi/mld/ptp.c  |  10 +-
 .../wireless/intel/iwlwifi/mld/regulatory.c   |   2 -
 drivers/net/wireless/intel/iwlwifi/mld/rx.c   |  11 +-
 drivers/net/wireless/intel/iwlwifi/mld/sta.c  |  31 +++-
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c   |   2 -
 .../wireless/intel/iwlwifi/pcie/internal.h    |  18 +-
 .../wireless/intel/iwlwifi/pcie/trans-gen2.c  |   3 +
 .../net/wireless/intel/iwlwifi/pcie/trans.c   |   6 +
 .../net/wireless/intel/iwlwifi/pcie/tx-gen2.c |  10 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c  |  12 +-
 .../net/wireless/intel/iwlwifi/pcie/utils.h   |   7 +-
 36 files changed, 452 insertions(+), 243 deletions(-)

-- 
2.34.1

