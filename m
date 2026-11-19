Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092250;
	b=jEeRyRgyuNxCaLb8OwhA7JtsQEcyIjBZFf306bKRaTxGRqiRzfWtowv27/x6Dr+7bY5B
	 /l0DcmnmHDriOUHhla/GZjSS0A/kjRja/990A2ag5TtmLPEoaZUoXFjjmJYCf2pXrTseE
	 oDi7X+fqRfDW9QerL1gfBbRUPngjrkELvpNx4vADq0NXlUIFvlw75exfYW0xFv+pujQbm
	 OyBTe8Z8GFSZ9nOcR2ur8NH7CF/QtsndJcou7LKjAVSQmq1WEhhnuY9+QX2/8zTen2RKi
	 zMKCWnyJQnV+6ZvBRh11wPcnbJlpMz13ail1Sn3iEt+tfUUHOllG77vAc/O4uA1yFrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092250;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sYZt2Ot/SAr/JdRuhBjp7g2eN5ZZgikhEFBoI34VVas=;
	b=2/GLB77fJnY0HspG0Pl1noS+YnNEjPmN5+MXyEfELQP89IwZ2/dSgIqK3pb40W0qF55E
	 +94cTAmZBPeakD6a0x37lu5RzOZ1YLJxFLZYM3wuPZqKbH35dFemw2HY3EcZTZvNxW6Ok
	 bovETohkR6lqkX5tuymUpuc7T+zR78UWLdVWoQOpK/YXSeOE0n2MM3qC3JuToBte+TyW/
	 5ovkWcuefmd7DVgX0wwhUOGP95aSS/co9U10vKs+O9SdMxvNkokRV3Uj6GbaWIvq7vZ8N
	 qI4kbNAAnobNsZQpH/eAHqpZPO/EicthgWONnU28ZqHVlc+Za9sMCYI5D86067ZBHYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b="h5/38EUr";
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47D960A2614
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 12:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47D960A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=h5/38EUr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=sYZt2Ot/SAr/JdRuhBjp7g2eN5ZZgikhEFBoI34VVas=; b=h5/38EUrTcugMXY8iVphgNu/Sw
	NRUsH1bq8foJU77Rlp6jknD7rerZhrHWGvoHRYNjzR5O8BIEEATHnbTtGwoxs+t12ObHr6n3zdWxp
	f9E87mNqVAmNcwd5PxumbPAnSDACox7w7xQjfZWpwk+LL7KE4LCUdyJZ44U44GGcq/cw=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xU1Uf-005VJk-2K
	for linux-wireless@vger.kernel.org;
	Thu, 19 Nov 2026 13:44:01 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 12/20] wifi: mt76: mt7915: read twt_list under the mutex in twt_stats
Date: Thu, 19 Nov 2026 13:43:44 +0100
Message-ID: <20261119124352.1842164-12-nbd@nbd.name>
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

mt7915_twt_stats() walks dev->twt_list under rcu_read_lock() alone, but
the writers of the list use plain list operations under
dev->mt76.mutex. A read during a teardown can thus loop without end.
Reachable via the twt_stats debugfs file.

Hold dev->mt76.mutex for the walk, as the writers and
mt7915_tx_stats_show() do.

Fixes: 34f374f85eff ("mt76: mt7915: add twt_stats knob in debugfs")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 0413b4fd2d9c..a4e95073001d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -1227,11 +1227,11 @@ mt7915_twt_stats(struct seq_file *s, void *data)
 	struct mt7915_dev *dev = dev_get_drvdata(s->private);
 	struct mt7915_twt_flow *iter;
 
-	rcu_read_lock();
+	mutex_lock(&dev->mt76.mutex);
 
 	seq_puts(s, "     wcid |       id |    flags |      exp | mantissa");
 	seq_puts(s, " | duration |            tsf |\n");
-	list_for_each_entry_rcu(iter, &dev->twt_list, list)
+	list_for_each_entry(iter, &dev->twt_list, list)
 		seq_printf(s,
 			"%9d | %8d | %5c%c%c%c | %8d | %8d | %8d | %14lld |\n",
 			iter->wcid, iter->id,
@@ -1242,7 +1242,7 @@ mt7915_twt_stats(struct seq_file *s, void *data)
 			iter->exp, iter->mantissa,
 			iter->duration, iter->tsf);
 
-	rcu_read_unlock();
+	mutex_unlock(&dev->mt76.mutex);
 
 	return 0;
 }
-- 
2.47.3

