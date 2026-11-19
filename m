Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092251;
	b=FjzxfFX/XfG5PVXRC8g7UTsE1UJTNUb27XVBdiE/FdYrQsPasTGzVdPN7pmfsfeiKPho
	 IPxSXHSbenR7Iuzdt+LkwshjvxLZ+X6LtcMTKDbsfn3STKyLib9t41z64lp8wu/qXKVIB
	 PBNZmYGRgc6GVOVaFTCuM04wMhviH8UxiKwBPCSSnuPNAEnUKs7w2gYLE4pp3AtpHx0qP
	 FpoybWLPhL6WnlnIviQ2viiFwbMjO/dI3kO8GbNICGXGFz+tvs4544W7SLnLZH2sz2b3n
	 TyxEUUkYBTUQVX2yxcpMO3tFCNhhMmSFbtuJHJ3IapT6jpoOgvY8eLt0fVQe0YxFswQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092251;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rbiWVO3w1el9Xa8hlGO0pfImn3UhHcLNiBpfP9jyDVM=;
	b=0J7kdv/kioKOrHYRsqYL6v11V5M6H0BWO5EqoE6yNZUPPd6IlmtvsA66g6CY6lrMyw7f
	 wzXNld3Wohjd0fw68wkBKaez6NPgbDbBWrvem5casgRfz8pynTvPpJ2BVHlTJxkjR45kz
	 gjTvq7H/piOhJQ81R2P1n3GwIGwMbigylyrk6kkun0gFZljgAQN/9M/lSiSGEeCVbYcgF
	 BLZh4sZQVNsuOC523dWmtOwnw8y7V9tvhfMh2E00jThGccLTXlXRdC8DOCyyVCjTgbr1/
	 2yIRiPXdlJZA/nlpZ+IIblQmmllLN1wDLWME2n8CXLjRW1KOk3RwUK+ANQDjaqP++pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=LLagID4K;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D760A2615
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A56D760A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=LLagID4K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=rbiWVO3w1el9Xa8hlGO0pfImn3UhHcLNiBpfP9jyDVM=; b=LLagID4KWj6n/+SZnCiBjg593D
	6mwu4w8+BYxh9N6SUgi3OyWcG0ZnBxM9fMIxAuD7Nhd2JTiW8Bk3iaQu9Kl+5vXJt3Y31vqYjgSnh
	X29G2Up8FlI/Cxxs30czA1zMbMuD6v6eJzPMnatnquEo9e6OCOldRdFyRYgSpi7yozPU=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Uf-005VJk-2r
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:01 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 13/20] wifi: mt76: mt7996: read twt_list under the mutex in twt_stats
Date: Thu, 19 Nov 2026 13:43:45 +0100
Message-ID: <20261119124352.1842164-13-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119124352.1842164-1-nbd@nbd.name>
References: <20261119124352.1842164-1-nbd@nbd.name>
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

mt7996_twt_stats() walks dev->twt_list under rcu_read_lock() alone, but
the writers of the list use plain list operations under
dev->mt76.mutex. A read during a teardown can thus loop without end.
Reachable via the twt_stats debugfs file.

Hold dev->mt76.mutex for the walk, as the writers and
mt7996_tx_stats_show() do.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
index 44a653deedc0..8f1ef19c3876 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c
@@ -901,11 +901,11 @@ mt7996_twt_stats(struct seq_file *s, void *data)
 	struct mt7996_dev *dev = dev_get_drvdata(s->private);
 	struct mt7996_twt_flow *iter;
 
-	rcu_read_lock();
+	mutex_lock(&dev->mt76.mutex);
 
 	seq_puts(s, "     wcid |       id |    flags |      exp | mantissa");
 	seq_puts(s, " | duration |            tsf |\n");
-	list_for_each_entry_rcu(iter, &dev->twt_list, list)
+	list_for_each_entry(iter, &dev->twt_list, list)
 		seq_printf(s,
 			   "%9d | %8d | %5c%c%c%c | %8d | %8d | %8d | %14lld |\n",
 			   iter->wcid, iter->id,
@@ -916,7 +916,7 @@ mt7996_twt_stats(struct seq_file *s, void *data)
 			   iter->exp, iter->mantissa,
 			   iter->duration, iter->tsf);
 
-	rcu_read_unlock();
+	mutex_unlock(&dev->mt76.mutex);
 
 	return 0;
 }
-- 
2.47.3

