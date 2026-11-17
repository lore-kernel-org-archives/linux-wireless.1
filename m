Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938511;
	b=soP9OYC6YPQGzC6Ghho1FSsix0rhw/stXfm5ucZr7DAAo+INJuMdDEZmYo9luKA/zH3e
	 IbH+m/B7lVRFaBqoMVKyzzyH/l+ddm7FasRFK1OmJ0sjKtOm62YLm6tBU7qaICULpfivN
	 v1647LUeKeo09o20Sx+fedq64JmBxVLbjkKvfJkuR4SvBCnfhPHP/gkDJgG0mDQ9ofyzg
	 +doGHn0sysv8cPToEexwuy5QiKTnfITg6glPAsIdYi4T1rALppiRVoRAgfHuGIKyH20ku
	 geivUIRjjeppsyNWSq0mEemCWEULtNdH3gzsqizSwtCYWv7uGV1N+hi4OnuimKG99YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938511;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QL80LiN6nZ8CSq/DkNlZeo9LRruG/ljPzNNNyvcEs78=;
	b=zxlWznw/5Heg3AmFnS0f0XSIqWVQ6NYMnoaW5YZRYrwZsZcBOYzgpT36TyFMoNDG8Oo4
	 Idd0zP5NJeiPCQMcNHk68nUq3/+Aas/0zJrKuiHtXKq8YR0XuAN89zQjkN1fJ5ZaL7wY9
	 idSZw0tkjAOOaIbvso7gAvUQ+Ig3+mxWtd7N6ldyXFMYK/NuLy7eCCNL+KP2IElvy0ly/
	 kfgl1KyZn37i1Mgl5iF0C5lm+97ODWdwWNKsYMVvdGhu4FdV+5AC48s/5xR3VnHIiUygK
	 awwIVs4Hd9z9QxDmizSGQEgmcrBbUUKEcu4HO/u6wU17yIs1NCiMgqh4ylbcowy5LiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=eP6tepTQ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C99E606A32F
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C99E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=eP6tepTQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QL80LiN6nZ8CSq/DkNlZeo9LRruG/ljPzNNNyvcEs78=; b=eP6tepTQ1TPO6JKmh5x+i2gc3z
	MaKzMuXCGSH+VqZcg1KHOCV2X6ttEex52bsMhBqi1f3prHvK30kknYIoSy4BtYh5Gg9D5i9yVKjsu
	+IPqg2Jrb22gog7kq4QSaceL2PMUEeSWFsRt+BoxF4DqxmuzteWEd2TKDAEQyvtbyjjs=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV0-004eiZ-0Y
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:42 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 01/19] wifi: mt76: don't pin undrainable PS stations in the tx scheduler
Date: Tue, 17 Nov 2026 19:01:16 +0100
Message-ID: <20261117180134.2940930-1-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
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

A power save station whose buffered frames cannot be delivered consumes
no airtime, so its airtime deficit never goes negative, and
ieee80211_return_txq() keeps it at the head of the active_txqs list.
With all bands on one ieee80211_hw, each scheduling round then ends at
that station, and all other stations starve.

Return the txq only when it sent frames or its queue is stopped.
__mt76_tx_complete_skb() schedules it again when a buffered frame
completes.

Fixes: a547b414bf7e ("wifi: mt76: add PS buffering support for HW-managed TIM drivers")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index ea9993e9a199..0085b7a29fce 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -625,10 +625,13 @@ mt76_txq_schedule_list(struct mt76_phy *phy, enum mt76_txq_id qid)
 			if (!mt76_txq_stopped(q))
 				n_frames = mt76_txq_send_burst(phy, q, mtxq, wcid);
 
-			ieee80211_return_txq(phy->hw, txq, false);
-
 			if (unlikely(n_frames < 0))
 				return n_frames;
+
+			/* an undrainable PS station would starve all others */
+			if (n_frames > 0 || mt76_txq_stopped(q))
+				ieee80211_return_txq(phy->hw, txq, false);
+
 			ret += n_frames;
 			continue;
 		}
-- 
2.47.3

