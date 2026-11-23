Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441766;
	b=a0RMPKl8ugVKJbVfy/+vh0i/xfYVEM4Xu9O/RlPLg1/mFyd0UhyFZkZrfXiJFAJhwFqQ
	 e4Pv9XfgVFJPGbtWWTPvDOzr5dPaT/rBmPr3bx70KYJC1OsApDXYUIZ00qHv/Khu7JCw1
	 p070Wbh/RnO+ZDifsV7k0Zca14ziZxfPF9YOGpdSBs303d/elnTcxTtVo66wlZXp20oHr
	 Q+rgDBZNnZyalYsaRQ7AuFZfF/Q6YzpF2Sm7cS/Aq9vdnHxrsQexom9Q4XjxFCNnA3nA2
	 yJ5uVybAoG+i8qtFhkyeq/Tux9tPf/Pp5zPhQsLYm/7LXBruVXqXarzIP9BAe0lOFlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441766;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eQwRNsF9g2iTMS2B1YikvBSFmY+qFUeNpjnu9vJX8IU=;
	b=xFAt/OLhUfByGUMKx8CgqpUJq6w84r8GoiXWVeYUHUncxBS+8gje4Yl57i0wlNZSoHcf
	 OhPvYov9h/Spn9jVsga4EaQhlvtue3Rmj//8k+1BS+w0aAlTkYu3OPgZjCgy7HCNgXNtB
	 uDIqulZU5w/Ur67QI8XGHjUwxFyMB74tCH1Ox1jhxnxVq6mYNlxf81RB/Fku0M8JoCHqy
	 Y+B96h1Jb1ap1BNrZx5k4xN4GOm5w7JinK1zBsV4nETCNqetJ3KN3yvJn6U7m+0TY9Lmw
	 1KDuUhNsE+d2yJQLIjSF18er5X+Y7raFS0nmnE9noZz+NacGZh8CHPeAZWG6aaVDHQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=CEmbrV3D;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAADD606A693
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAADD606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=CEmbrV3D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eQwRNsF9g2iTMS2B1YikvBSFmY+qFUeNpjnu9vJX8IU=; b=CEmbrV3DkRcsRCn/TW415wErbH
	g4MMqh+shZUaxgsZ8JdiBKyguPqHuH/3WHXztoDHUIQTEEgPPnpNdgUk5jZt+wBuJVXLiPDp5kAAs
	IBcqU5SriPykQyMHiuwMI8h5YSWQUEFH/wHj74Of6YH9D7ceFZ63HUqAc2bmWIcqbrQw=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ8-007NFk-1I
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:24 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 16/20] wifi: mt76: mt7996: divide by the full TWT wake interval
Date: Mon, 23 Nov 2026 14:49:15 +0100
Message-ID: <20261123134920.154270-16-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

mt7996_mac_add_twt_setup() passes the 64-bit wake interval of a TWT
request as the 32-bit divisor of div_u64_rem(). An interval that is a
multiple of 2^32 us thus gives a division by zero, which traps on x86
with the driver mutex held.

Any device in range can trigger this with one TWT Setup frame. The frame
is not robust, so it is accepted with the address of any associated
station. Neither mac80211 nor mt7996_mac_check_twt_req() bounds the
exponent or the mantissa.

Divide by the full interval with div64_u64_rem().

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 229f797f4302..d724ac425b42 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -3369,13 +3369,12 @@ void mt7996_mac_add_twt_setup(struct ieee80211_hw *hw,
 	if (sta_setup_cmd == TWT_SETUP_CMD_REQUEST ||
 	    sta_setup_cmd == TWT_SETUP_CMD_SUGGEST) {
 		u64 interval = (u64)le16_to_cpu(twt_agrt->mantissa) << exp;
-		u64 flow_tsf, curr_tsf;
-		u32 rem;
+		u64 flow_tsf, curr_tsf, rem;
 
 		flow->sched = true;
 		flow->start_tsf = mt7996_mac_twt_sched_list_add(dev, flow);
 		curr_tsf = __mt7996_get_tsf(hw, &msta->vif->deflink);
-		div_u64_rem(curr_tsf - flow->start_tsf, interval, &rem);
+		div64_u64_rem(curr_tsf - flow->start_tsf, interval, &rem);
 		flow_tsf = curr_tsf + interval - rem;
 		twt_agrt->twt = cpu_to_le64(flow_tsf);
 	} else {
-- 
2.47.3

