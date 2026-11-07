Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060998;
	b=emcG2/dDi+X3EBTBeRx94KC3q7f3UjwhE+UmmOwbIdij8sYpPq8/PIBWYr3rf50MI3Bo
	 4oUViH2n1bXuMiyy20Wfm94wZFG+DBoCuDN5dxugs5QtdS5hOkMAKcugJbMQXP/hEb99R
	 7oJoAry+FsPigjiBo4FVLcFINGPOuZVqYa94wjnEGeNKI782JuYCHfrpaCIovjpHudX7Z
	 KrwdgiUZKkgnSU0aklJ6FRCEdItDzHLn3zu1H/h1UUpGq1mkuI/EyzEsceQgXfeA20/IF
	 b8/62q2pRS7VK721q7bWx0AxbuXuXYdfAguqhY1ips2ffNDwlw/9PMKsPjHXmkocXMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060998;
	h=DMARC-Filter:Received:To:To:To:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
	 References:From:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=aCryBT0BxE4GLsnVX4YQvOoV2Sj/hFLWMgcKubFl8Vw=;
	b=194DTNIvmnmbCSLpDrjD7YenkMC7y6xZEAKEc1CCyfLzMQd5j6s8zBFIZzCqeGu6S2JT
	 pvFSoXVXovFL59DUpTsnvBKslT0FRlofD7DdEFlDv4fIN6KqyyH19dcQQHtXHQ2LVn0lm
	 E3r3W66ahvKqLypQQbW2/zHePyhmPAsmnVI22NwagYaZmp37KpPXEdElUovljIqwup7Hx
	 XhPsJvaPkZhHOYoC/RKs0PJj5Io7S/Apa2H3F2Wg/+m5IPWtmuCwOJhMS8svmqz4FFvmm
	 9Uk6OJuyYesPd8RfyOA3H5xDkk5NqZFBneo8ODkfSqLGdvkfKZ2GFN56d91JvgI2HZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.25
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C64606A33B
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 14:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C64606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAnvrOuMu9qM6GFAA--.6298S3;
	Sat, 07 Nov 2026 22:16:17 +0800 (CST)
To: nbd@nbd.name
To: lorenzo@kernel.org
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: lucid_duck@justthetip.ca
Cc: eason.lai@mediatek.com
Cc: angelogioacchino.delregno@collabora.com
Subject: [PATCH v2] wifi: mt76: fix skb leak in SDIO tx queue full path
In-Reply-To: <20260917154813.5823-1-lucid_duck@justthetip.ca>
References: <20260917122058.2150817-1-vulab@iscas.ac.cn>
 <20260917154813.5823-1-lucid_duck@justthetip.ca>
From: Wentao Liang <vulab@iscas.ac.cn>
Date: Sat, 07 Nov 2026 14:16:24 +0000
Message-ID: <179406098498.2377448.7089145955388574856@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnvrOuMu9qM6GFAA--.6298S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGr48CF4rZr4kJFWDXryDAwb_yoW5GFWDpF
	W8K3yYvrn7Jrs7C3WkWF48Ja4Y9a1rGr98JryxW34rurs8Zr1Y9ay8Ca47ZrWrtrZ3Kaya
	qF40vrn8G3yDW3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Fb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJr0_GcWlOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxkF7I0Ew4C26cxK6c8Ij28I
	cwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IU5HT5JUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcEA2rvBClMRAAAsm
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list

The mt76 queue ops take ownership of the skb handed to tx_queue_skb():
the DMA implementation releases it through ieee80211_tx_status_ext() on
every error path, and the USB implementation was changed to do the same
by commit 82856da2d3b6 ("wifi: mt76: fix memory leak in USB TX path").

mt76s_tx_queue_skb() still returns -ENOSPC without releasing the skb.
The queue full check runs before tx_prepare_skb(), so no pktid has been
registered in wcid->pktid at that point; the skb only has to be completed
through ieee80211_tx_status_ext(), which also frees it.

Release the skb on the queue full path as well.

Fixes: d39b52e31aa6 ("mt76: introduce mt76_sdio module")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
Changes in v2:
- Sorry for the long delay in following up.
- Rebased on v7.4-rc1 and dropped the USB hunk, which is already fixed by
  82856da2d3b6 ("wifi: mt76: fix memory leak in USB TX path").
- Dropped the tx_prepare_skb() hunk, which is already fixed by
  808f2767d421 ("wifi: mt76: mt792x: Fix memory leak in SDIO TX path").
- Only the tx queue full path is handled now.

Disclosure: the candidate was found with our static analysis tooling, and
the audit and the fix were assisted by DeepSeek and GPT 6.1 sol.

 drivers/net/wireless/mediatek/mt76/sdio.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c b/drivers/net/wireless/mediatek/mt76/sdio.c
index ba5f123f7e39..c59553b29df3 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio.c
@@ -530,18 +530,15 @@ mt76s_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 	int err, len = skb->len;
 	u16 idx = q->head;
 
-	if (q->queued == q->ndesc)
-		return -ENOSPC;
+	if (q->queued == q->ndesc) {
+		err = -ENOSPC;
+		goto free_skb;
+	}
 
 	skb->prev = skb->next = NULL;
 	err = dev->drv->tx_prepare_skb(dev, NULL, qid, wcid, sta, &tx_info);
-	if (err < 0) {
-		status.skb = tx_info.skb;
-		spin_lock_bh(&dev->rx_lock);
-		ieee80211_tx_status_ext(dev->hw, &status);
-		spin_unlock_bh(&dev->rx_lock);
-		return err;
-	}
+	if (err < 0)
+		goto free_skb;
 
 	q->entry[q->head].skb = tx_info.skb;
 	q->entry[q->head].buf_sz = len;
@@ -553,6 +550,14 @@ mt76s_tx_queue_skb(struct mt76_phy *phy, struct mt76_queue *q,
 	q->queued++;
 
 	return idx;
+
+free_skb:
+	status.skb = tx_info.skb;
+	spin_lock_bh(&dev->rx_lock);
+	ieee80211_tx_status_ext(dev->hw, &status);
+	spin_unlock_bh(&dev->rx_lock);
+
+	return err;
 }
 
 static int
-- 
2.34.1

