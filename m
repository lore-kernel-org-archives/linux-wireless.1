Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.244.123.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314043;
	b=bT5erHKPn3qNen4a3dOaQbMFBwlWq85Cf+q/nTrY6hID2224KjBUwagdMbfF39EC0iCs
	 1wSpTB/xqI+lnmef1+XD+tRyzrtsF3gITXVZLv+yYNxgz1T28GLtRI2xlJX+Z7bIcfgNe
	 aVFktbXMz/qnnOoo9PyGbNNDpoh+TpkSiCFGRYvGjCsPP6aQNCuwm6qlFMykjkS2kzk0S
	 Ik0ha6lYXRIo5f5BTselVWUD4va1qseB8SvCZKI3E+HE0ox3Crr8dneiZcJfWxAcbpDON
	 aeVkHyjCTt4XJ6ggOHrYTy7oDs0YXXzPzubPyv8EK55/zUKLaV2bgV74QKTC/ZzFNVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314043;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-MTK;
	bh=Nb0VjpPF5N2RoOO7Q87qV0NcLe/eXymGX6jacBZvi2k=;
	b=dTT2zyJQI+wYxkXuK7WEAnEwtkk9LSvl2Kks6Sl7vyQ7y/iAgUsK41m4goladZC2Dz+G
	 63ErofIVYkQaNJOtxPLj1FH5rMzqxNkejLncMoF0uoiyx93okrNaEGKNugkLKyMf4MuIf
	 Yzty4s+uZX0ceJIld4VADU8XBQmZdUHPbDLi8dbXBk1HiyrVGTiSKnmR3KmSG1G2jepjl
	 G6q4k+m2aN/Eg252s+UoYsKUG4XODV5SM34f0C9Ixlp85ru6pJi1bEW8kmOjERmaumTdO
	 1EAnc4igZxecEiOz21mw6gSO+3S+E6yB3Eb/Pi9DYxIN34mKbsItYWWUvqoXgsw7QEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lBgVTl0X;
	arc=none smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264EB606A33A
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 12:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 264EB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lBgVTl0X
X-UUID: ff237d78dd0211f1b1788b6acf885367-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Nb0VjpPF5N2RoOO7Q87qV0NcLe/eXymGX6jacBZvi2k=;
	b=lBgVTl0Xl8WL/6ueAQ790ZmJ3nt55BGd3eot8ue92n7I3VXI84L9ZCVMOKfJ3DZfylDRXk6CLZI0phqlG9NUXqVgGbuHPGOhQ+MWhy+XKrQAVogCuwSdzNZpbZ/i513Jb0D8T8+I1DaoZkWxhf5EMEBq/aftgxSo5QLfTG4QNJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:532c80cc-11bd-4482-9bd6-404d174d6ffa,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:b6a08d8d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ff237d78dd0211f1b1788b6acf885367-20261110
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <james-ly.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1477061602; Tue, 10 Nov 2026 20:33:56 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 20:33:55 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 20:33:55 +0800
From: James-LY Huang <james-ly.huang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<sean.wang@mediatek.com>, <jb.tsai@mediatek.com>, <kun.wu@mediatek.com>,
	<James-LY.Huang@mediatek.com>, james-ly huang <james-ly.huang@mediatek.com>
Subject: [PATCH v2 1/1] wifi: mac80211: don't coalesce a new ROC onto an expired one
Date: Tue, 10 Nov 2026 20:33:51 +0800
Message-ID: <20261110123351.566633-2-james-ly.huang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261110123351.566633-1-james-ly.huang@mediatek.com>
References: <20261110123351.566633-1-james-ly.huang@mediatek.com>
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

From: james-ly huang <james-ly.huang@mediatek.com>

ieee80211_coalesce_hw_started_roc() computes the time the running
ROC has left with an unsigned subtraction of 'now' from its end
time. When the running ROC has already expired, the subtraction
wraps around, the check whether the new request still fits into
the remaining time passes, and the new request is coalesced onto
a ROC that has already delivered its events: the new ROC is never
started, and the cookie handed to userspace never expires.

That state is not unusual: a driver usually processes
ieee80211_remain_on_channel_expired() in a work item, so until
that work runs an expired ROC is still on the list with
started=true. A remain-on-channel or off-channel mgmt-TX request
issued in that window hits exactly this path.

Track the end time of the running ROC explicitly and refuse to
coalesce once it has passed. The remaining window computed from
that end time is then guaranteed to be positive.

Signed-off-by: james-ly huang <james-ly.huang@mediatek.com>
---
v2: rewrite commit message and comment
---
 net/mac80211/offchannel.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/offchannel.c b/net/mac80211/offchannel.c
index 44808120ff51..e54425d87b08 100644
--- a/net/mac80211/offchannel.c
+++ b/net/mac80211/offchannel.c
@@ -529,7 +529,7 @@ ieee80211_coalesce_hw_started_roc(struct ieee80211_local *local,
 				  struct ieee80211_roc_work *cur_roc)
 {
 	unsigned long now = jiffies;
-	unsigned long remaining;
+	unsigned long end;
 
 	if (WARN_ON(!cur_roc->started))
 		return false;
@@ -540,12 +540,19 @@ ieee80211_coalesce_hw_started_roc(struct ieee80211_local *local,
 	if (!cur_roc->hw_begun && new_roc->duration > cur_roc->duration)
 		return false;
 
-	remaining = cur_roc->start_time +
-		    msecs_to_jiffies(cur_roc->duration) -
-		    now;
+	end = cur_roc->start_time + msecs_to_jiffies(cur_roc->duration);
+
+	/* the current ROC may already be over: drivers handle its
+	 * expiry in a work item, so until that work runs it is
+	 * still listed here with started set and no time left -
+	 * coalescing onto it would leave the new request queued
+	 * behind a ROC that produces no more events
+	 */
+	if (time_after_eq(now, end))
+		return false;
 
 	/* if it doesn't fit entirely, schedule a new one */
-	if (new_roc->duration > jiffies_to_msecs(remaining))
+	if (new_roc->duration > jiffies_to_msecs(end - now))
 		return false;
 
 	/* add just after the current one so we combine their finish later */
-- 
2.45.2

