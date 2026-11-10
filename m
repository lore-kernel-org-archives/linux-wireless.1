Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314042;
	b=ur9jCgekaQohJjPhCvmQKqD5x73z4aTd2kbhnBozML8Om1Yht1KfCXcKqPF4TqjFYNKO
	 LY/FZHAOK6/ZvaRbJs1nELXNQUnsY6n3MLTGynnF7Eoyr/F7p614SNFvq1pFMt3FDWJJa
	 zgWdXn4cB4bJfULYZuZJAM97U2xGRegctn9hTKMnYMA7wJq9S6sbZRnLLs5oiCL+2AfYh
	 PTHsTN5dZHToJCzCeCIIM65CIF6Z/JGoiCsJAPbywy+rf4nOWOb4UK/PHIfnXBbn96FX7
	 F4SOb+eiPtCcE768BOAcskrA0PfSkUXqxuG+He/NiQm92lOWSYcbNsUEEi5h2reYzgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314042;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=cxMTIjXRdQvtPP725G7qVD4ba99GFCdXfLsXZF2kHPw=;
	b=XygDx9zioETkUqfgTEQLqSnSZYDoYq46QxsPPYXBfocD2kvT0zxXoAwXPcHM+plkT/yy
	 kcGWcojSg5+iTKTc7VAPeTwRW76bdRdQ/to0bRIYGzCkm+eqlLiPhRwQLYKVzkJmYvl2r
	 7awZYDMF7ONm0QarJcICWON4idvZx+Z7y7f1NEpJMB4U1208WsMVibCsmTAr547aRSJfm
	 uToQae1YxC0Ln3tEa4/za1n3OTES7d/Zyfxi45H6gTTs71RvutMaNwZnKoyZ4jM/o319a
	 l/bGceNcM2yNGi3elCFPuHlDlSoGrSdKconI1HyhHnYF6WAAvRe/w7xKQ8cLkCl3gWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=JCntIEsa;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B6D606A334
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 12:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B6D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=JCntIEsa
X-UUID: ff06a130dd0211f18dc8c9802ae25ab1-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cxMTIjXRdQvtPP725G7qVD4ba99GFCdXfLsXZF2kHPw=;
	b=JCntIEsaeWsym3hkqSijBiYV31IDHg808a3h1Eo30GWBwMs6IiscmR5VFsczO9TJS61+84sAz5jcfLhwt+jg/20S1yONvQfmj8r5hlJBRmgXHfMhamZewR+JJU8sFoXYBRebZRIFzKKRcu8tI33oqxeFRN/RS8ZCy6505bhZn4s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e65a069b-97e2-4fd9-9127-b03f480a8549,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:5c801966-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ff06a130dd0211f18dc8c9802ae25ab1-20261110
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <james-ly.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1653668281; Tue, 10 Nov 2026 20:33:56 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 20:33:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 20:33:55 +0800
From: James-LY Huang <james-ly.huang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<sean.wang@mediatek.com>, <jb.tsai@mediatek.com>, <kun.wu@mediatek.com>,
	<James-LY.Huang@mediatek.com>, mtk18285 <james-ly.huang@mediatek.com>
Subject: [PATCH v2 0/1] wifi: mac80211: don't coalesce a new ROC onto an expired one
Date: Tue, 10 Nov 2026 20:33:50 +0800
Message-ID: <20261110123351.566633-1-james-ly.huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: mtk18285 <james-ly.huang@mediatek.com>

ieee80211_coalesce_hw_started_roc() merges a new remain-on-channel
request into a running one when the new duration fits into the time
the running ROC has left. That remaining time is computed with an
unsigned subtraction which wraps when the running ROC has already
expired, so the "fits" check passes and the new request is queued
behind a ROC that has already delivered its events: the new ROC is
never started, and the cookie handed to userspace never expires.

The expired-but-still-listed state is not rare: a driver usually
processes ieee80211_remain_on_channel_expired() in a work item, so
until that work runs every ROC whose time is up stays listed with
started=true.

This series refuses to coalesce once the running ROC's end time has
passed, so a new request always gets a fresh ROC of its own. It has
been verified with a full x86_64 defconfig kernel build and passes
scripts/checkpatch.pl with no errors or warnings.

Changes in v2:
  - rewrite the commit message and the code comment as requested
    by the reviewer; no functional change.

james-ly huang (1):
  wifi: mac80211: don't coalesce a new ROC onto an expired one

 net/mac80211/offchannel.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

--
2.45.2

