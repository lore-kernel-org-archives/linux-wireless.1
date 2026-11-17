Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922627;
	b=QN4o+NVd+xUw5KdicT95g8FhIgF7g4uu2uHOJ4tTfhVnYM7attzFPACuiTxIdG6sFdEE
	 kS6rOJkB6UQpjP09QZj1vjWPCEKkv9YhzF3L9WSls+QSJW+HBpy9zZXEVHCLkucbg8XLQ
	 rJa0aF3epoz0lP3IHSDV9b1ASNJ3W8yy53/hsolh7oA285CepLJqWZ+NJCqXJrf786+9r
	 tNqbsppXG3ZN189tDJE4uQvag+RQUdh63x84wQ6SVzzuxRji4dFJpyVtLxKZv9coiVe/d
	 zLXg33ntIc4FyxIsdRr0wX5hfwXuHEp63BCTazPCVSk59Fe1OCsVqn76RxmEGPaMCMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=YK/TbO2kXqkzmoXHCrnehULeudr+4/La75Kvjdh7MGs=;
	b=LEEOYgod+mQm0EwOQiKUOOkB3ckxJqidutDEkRIi46ivV8k2gIFDDeYL3ZhFMuAl/LYU
	 OmbHDlmt7F45s0QpDGaep9GiWZR+9FquL+dKPQxDNIAWXPjlkqjmGPU331X2mWTWgZ4HE
	 LKo87Tx/MXENNn8oskTrbiuqKyj+oj1Ldw1GXYZNGXtbr2GYzB+/4vOE5Bs1RBGDOVkIG
	 F/IfP+Gs6pvHmdj+Gglw1mAglh35zsnBg7YtsPxzBdwfJ0nPaSTbGuT4wp3QsRBCFoMNj
	 k4fEiCTSmdve8cpxpOXBXYtz8zj0Xd8Xyy9JcydNXsSih8jBVxGnOJizNDb7KoSLVuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8toN4Ib;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484AF606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 13:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 484AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C8toN4Ib
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so93260a12.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 05:37:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922624; cv=none;
        d=google.com; s=arc-20260327;
        b=eefwUUiLILeo0k5RsgkItrK/EEc5T6x59e9pgiLfoB/fv4cMt9fqb5+2sEfVj4pPr0
         9lkikE+wV0gqPJFVHgqq8lgutYydxl7PeMr7EwZ7y2y4C1RAT2EeVtGjQ7g6HGMsf0CS
         iyUE1ok+6cPZWqjK1OEAluXjW8kac0luLpf9x+7xT+W0WAcDpAf46ZKq3ZatsnKC17eq
         baRzZetF+IMe7eHhWsUvIWuQ3OVv+7yQkukii3u5IuNkmCp0lErjMyt/dtNk2QYImL4y
         v790H6X47YbM0pW5k7HeE6xDenSXFaLwxvZdvBWmXtP8AX/9TVLOVIynKKtO/i//yB4t
         lN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YK/TbO2kXqkzmoXHCrnehULeudr+4/La75Kvjdh7MGs=;
        fh=tAuldKSYQM3h93UrOG9YVKsXsnBnBEQ+vh72tuPeY9g=;
        b=Wnzc+BZwktpKZJcie/39a6r9rR7+DnVLm1HX8JOUOD38UUBF2/4nxkykQUgvqsfRV0
         cAI6sq5BE9tA9pVM5jsxCEl0BBAUEbXo1ft42S4GmGAjpvzZ8qUGawOl0TSGAXUcekrT
         qNIiUkitS/KunWSHbXutF+fJ/bDWr9gr4/aL733N/pNzqpSfnt6uvOBsNQecRLw4jWt+
         LrUq6ujl66iMUPSVWIH3dk+oCMINzl8vns/73TNISEYcNQSqCLa9gSBJOJkuV5MFnwmx
         Kcqr5h3/p/SwKSpAkGJJvbWQp2OD4trNKR3EiQ4M3k5Iwko8tR1g94hDCOexn8jUWHDS
         7zmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922624; x=1795527424; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YK/TbO2kXqkzmoXHCrnehULeudr+4/La75Kvjdh7MGs=;
        b=C8toN4IbBBri830whW0FaHmcszrimUZo10pQYmh97sGUbSL5GpM2GAbifROkt5/QUN
         bRArPW9zdd8crJZlri2QBG7QK5a43VgSJbAFjztUMlQi08FZN3urSK7Dteu7ItX1rkx+
         EukfCN3IjEkAC4JSZoIS/j1oxDOvNvZ+dIN69pniVfdu+8u3Dsqim8D42/rzZmZF4q8/
         BRd4NLiOxsquEW52IFNEPawhL5heNUu/q+C8xfoSIRJ8kEHE6l1s/fSfCcK3liG9wAIb
         jGL9uV2bpPtizb2o/vClQ4HGgK+H962axB9yRDlOqN8NfGjK+WtsEOo3z40SRfxl7mkQ
         ysqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922624; x=1795527424;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YK/TbO2kXqkzmoXHCrnehULeudr+4/La75Kvjdh7MGs=;
        b=JSglu/fNO38djfZSz1Rpnhjolshs1BGOT2kY+aSm9jH26LbWg9bzQr3qN8Nsi2aU4v
         2g0xDDXGhwy4tKAggTY6xV2n++phfqFQzPeR4k56jhm45/JADHd56j+I/q5zWxBCa2sM
         F7/O54JE0T2/q9dATBOedFiPGAl15ZboTEiCT9Wy75DcFb5oWU8ExI4QFAG1+LBpvu3G
         7LkN7KQ193UB5pCL0Cqph7heazlw9L+7Vg1omr2M21fSxU5YIKpoOPInHpo349QkmlQR
         FyyuKZ5PITYXpHlLob0SBInMEALj9IZQGk5HNcY0uJU4VlJqv7ZBr9b/9Juoo83wcpaM
         mZag==
X-Forwarded-Encrypted: i=1; AL+hErEVJQQ+mRZinctdGJLgFjGdfYAW8dJQTjDIRNjavIq6IsysZWYBSVsJHpBeTklkoPKHi3coQr3pFJeaUZWpqQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TPuwv7ViNacdp1XPtLWyJUOLOEEW/KEruwfIs7cCfZc1GeQkA
	AyTvYMySDVSZK1MHPF9FUzYfpjE2/n705F53JUcuCP9AfWXbQs1wFkA07BzamKWP53lgMmymhLL
	Xbv5kw5HzUDVfXUP2SvduJ/sEGujsAW3so0p8wPE=
X-Gm-Gg: AYBFou0r2UZnuI4woEvb78uoosV84FG0PZ7VGAXJIAATsc1LbCB5/rYAyXXJNIcnFT1
	mH1sJvf5V9vsHBbX2lvdIe3K4exHzf1rNO0LId2natpRbTOO1wOYcf1geOkAITIU79frn1KucaX
	AHT1vm1aFvB/0w44cTNKewCtECf7/fj8pc5iaNHcTs72sTKkvNnRHnjc/LmgemaD5EvYXb+EdAT
	iJPV4CyN0jizHU8zkRSLQ3uwZPLsXJoTkby3oXINmPo4Gc2e4Nw1FYxgQWiVkfYNJNRc1+98Zfi
	/ZIW76/W6mUkyeO1/D4e/zX6LGrycZdbQ0sHCjKn5HrkIFy209ep/5xwsn9hj8WH4Qhec/JF8xb
	9uxuFcdw5aRIfQMnyx8PknpnQWYjbenUgBFgfSS7xoQfEniuDWklAXjgHkRQp/ADxKJaRv47nPr
	eTnfF7H//d7WyLQgY+fLuotj1Vv874BReSX2oUFYqJ3ouZRP/Y
X-Received: by 2002:a05:6402:5020:b0:6b6:fec8:d0a8 with SMTP id
 4fb4d7f45d1cf-6b7c0d130ddmr10635445a12.43.1794922624177; Tue, 17 Nov 2026
 05:37:04 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Tue, 17 Nov 2026 16:37:19 +0300
X-Gm-Features: AclHuK-i33VFawQkDah8OYt8KddntcXhfz4VVgtP5FsEbuq5W9DQJCIPqGBbtz4
Message-ID: <CAMnMt5YR=z5FKHFk3bJSh1FZCq5C6EafqWV8OQ62U_23Da314w@mail.gmail.com>
Subject: [PATCH] wifi: mt7601u: optimize throughput and reduce latency
To: kuba@kernel.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Herman Semenoff <GermanAizek@aizekgroup.ru>
Date: Tue, 17 Nov 2026 16:30:00 +0300
Subject: [PATCH wireless-next] wifi: mt7601u: optimize throughput and
reduce latency

Optimize connection throughput and ping latency on MT7601U adapters:

1. Enable TXOP Burst for Best Effort (AC_BE) traffic:
   mt7601u_conf_tx() mapped queues with hw_q = q2hwq(queue) and only
   assigned TXOP 0x60 (~3ms) if !hw_q. Because hw_q 0 corresponds to
   Background (AC_BK), Best Effort traffic (AC_BE) was left with txop = 0.
   This forced contention and backoff after every single frame. Grant
   txop 0x60 for AC_BE when txop is not explicitly set, and program it
   into both MT_EDCA_CFG_AC and MT_WMM_TXOP.

2. Avoid periodic USB register sweeps during normal operation:
   mt7601u_mac_work() read 24 registers over the USB control pipe every
   10 seconds solely to populate debugfs counters. Each synchronous USB
   read loop took ~5-10ms holding vendor_req_mutex, causing recurrent
   latency spikes and packet loss (ping jitter up to 100+ ms). Separate
   mt7601u_mac_read_stats() and invoke it on-demand from debugfs show,
   leaving mac_work to perform only lightweight hardware error checks.

3. Eliminate artificial delay in TX status processing:
   In mt7601u_tx_tasklet() and mt7601u_tx_stat(), stat_work was queued
   with 10-20ms delay. Under moderate TX load, the 16-entry hardware TX
   status FIFO overflowed, dropping frame status and causing minstrel_ht
   to erroneously throttle transmit rates to MCS0. Reschedule stat_work
   with zero delay when status entries are pending or cleaned.

4. Optimize A-MPDU density and USB RX aggregation timeout:
   Set ampdu_density to IEEE80211_HT_MPDU_DENSITY_NONE to eliminate the
   2us inter-frame padding between aggregated MPDUs. Lower
   MT_USB_AGGR_TIMEOUT from 0x80 (~4.2us) to 0x40 (~2.1us) to deliver
   incoming bulk packets to the kernel networking stack faster.

5. Rate-limit TSSI saturation error prints:
   Use dev_err_ratelimited() in mt7601u_tssi_cal() to avoid console
   flooding and latency hit during calibration.

Benchmarks measured with iperf3 connected to an 802.11n OpenWrt AP:

  - TX Rate (Minstrel HT):
      Before: 7.2 MBit/s (MCS 0)
      After:  43.3 MBit/s (MCS 4 Short GI)

  - UDP Throughput & Jitter (iperf3 -u -b 30M):
      Before: 15.3 Mbits/s, Jitter 0.893 ms, 10-15% packet loss
      After:  28.5 Mbits/s, Jitter 0.125 ms, 0.0% packet loss

  - TCP Throughput (iperf3):
      Before: 14.6 Mbits/s
      After:  16.5 Mbits/s (peaks up to 18.9 Mbits/s)

  - Ping Latency (100 packets to AP):
      Before: min/avg/max = 0.736 / 5.184 / 103.984 ms, 3.3-10% loss
      After:  min/avg/max = 0.690 / 1.861 / 10.598 ms, 0.0% loss

Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
---
 drivers/net/wireless/mediatek/mt7601u/debugfs.c |  2 ++
 drivers/net/wireless/mediatek/mt7601u/dma.c     |  3 +--
 drivers/net/wireless/mediatek/mt7601u/init.c    |  2 +-
 drivers/net/wireless/mediatek/mt7601u/mac.c     | 10 ++++++++--
 drivers/net/wireless/mediatek/mt7601u/mt7601u.h |  4 ++--
 drivers/net/wireless/mediatek/mt7601u/phy.c     |  4 ++--
 drivers/net/wireless/mediatek/mt7601u/tx.c      | 17 ++++++-----------
 7 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
index dbddf256921b..ccf23df77ea5 100644
--- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
@@ -35,6 +35,8 @@ mt7601u_ampdu_stat_show(struct seq_file *file, void *data)
  struct mt7601u_dev *dev = file->private;
  int i, j;

+ mt7601u_mac_read_stats(dev);
+
 #define stat_printf(grp, off, name) \
  seq_printf(file, #name ":\t%llu\n", dev->stats.grp[off])

diff --git a/drivers/net/wireless/mediatek/mt7601u/dma.c
b/drivers/net/wireless/mediatek/mt7601u/dma.c
index 773a1cc2f852..f1d8573c2888 100644
--- a/drivers/net/wireless/mediatek/mt7601u/dma.c
+++ b/drivers/net/wireless/mediatek/mt7601u/dma.c
@@ -289,8 +289,7 @@ static void mt7601u_tx_tasklet(struct tasklet_struct *t)

  set_bit(MT7601U_STATE_MORE_STATS, &dev->state);
  if (!test_and_set_bit(MT7601U_STATE_READING_STATS, &dev->state))
- queue_delayed_work(dev->stat_wq, &dev->stat_work,
-   msecs_to_jiffies(10));
+ queue_delayed_work(dev->stat_wq, &dev->stat_work, 0);

  skb_queue_splice_init(&dev->tx_skb_done, &skbs);

diff --git a/drivers/net/wireless/mediatek/mt7601u/init.c
b/drivers/net/wireless/mediatek/mt7601u/init.c
index c01bb3fc4a7f..f67232ecfe6a 100644
--- a/drivers/net/wireless/mediatek/mt7601u/init.c
+++ b/drivers/net/wireless/mediatek/mt7601u/init.c
@@ -549,7 +549,7 @@ mt76_init_sband(struct mt7601u_dev *dev, struct
ieee80211_supported_band *sband
  ht_cap->mcs.rx_mask[4] = 0x1;
  ht_cap->mcs.tx_params = IEEE80211_HT_MCS_TX_DEFINED;
  ht_cap->ampdu_factor = IEEE80211_HT_MAX_AMPDU_64K;
- ht_cap->ampdu_density = IEEE80211_HT_MPDU_DENSITY_2;
+ ht_cap->ampdu_density = IEEE80211_HT_MPDU_DENSITY_NONE;

  dev->chandef.chan = &sband->channels[0];

diff --git a/drivers/net/wireless/mediatek/mt7601u/mac.c
b/drivers/net/wireless/mediatek/mt7601u/mac.c
index ca9cf628eb10..fff799ea5a99 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mac.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mac.c
@@ -298,10 +298,8 @@ static void mt7601u_check_mac_err(struct mt7601u_dev *dev)
  mt76_clear(dev, MT_MAC_SYS_CTRL, MT_MAC_SYS_CTRL_RESET_CSR);
 }

-void mt7601u_mac_work(struct work_struct *work)
+void mt7601u_mac_read_stats(struct mt7601u_dev *dev)
 {
- struct mt7601u_dev *dev = container_of(work, struct mt7601u_dev,
-       mac_work.work);
  struct {
  u32 addr_base;
  u32 span;
@@ -345,6 +343,12 @@ void mt7601u_mac_work(struct work_struct *work)
  }

  atomic_set(&dev->avg_ampdu_len, n ? DIV_ROUND_CLOSEST(sum, n) : 1);
+}
+
+void mt7601u_mac_work(struct work_struct *work)
+{
+ struct mt7601u_dev *dev = container_of(work, struct mt7601u_dev,
+       mac_work.work);

  mt7601u_check_mac_err(dev);

diff --git a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
index 118d43707853..584007890b1f 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
+++ b/drivers/net/wireless/mediatek/mt7601u/mt7601u.h
@@ -28,7 +28,7 @@
 #define MT_BBP_REG_VERSION 0x00

 #define MT_USB_AGGR_SIZE_LIMIT 28 /* * 1024B */
-#define MT_USB_AGGR_TIMEOUT 0x80 /* * 33ns */
+#define MT_USB_AGGR_TIMEOUT 0x40 /* * 33ns */
 #define MT_RX_ORDER 3
 #define MT_RX_URB_SIZE (PAGE_SIZE << MT_RX_ORDER)

@@ -354,7 +354,7 @@ int mt7601u_phy_get_rssi(struct mt7601u_dev *dev,
 void mt7601u_phy_con_cal_onoff(struct mt7601u_dev *dev,
        struct ieee80211_bss_conf *info);

-/* MAC */
+void mt7601u_mac_read_stats(struct mt7601u_dev *dev);
 void mt7601u_mac_work(struct work_struct *work);
 void mt7601u_mac_set_protection(struct mt7601u_dev *dev, bool legacy_prot,
  int ht_mode);
diff --git a/drivers/net/wireless/mediatek/mt7601u/phy.c
b/drivers/net/wireless/mediatek/mt7601u/phy.c
index d4cd2215aba9..d8f1dac455ba 100644
--- a/drivers/net/wireless/mediatek/mt7601u/phy.c
+++ b/drivers/net/wireless/mediatek/mt7601u/phy.c
@@ -916,11 +916,11 @@ static int mt7601u_tssi_cal(struct mt7601u_dev *dev)
  dev_dbg(dev->dev, "Power curr:%08x diff:%08x\n", curr_pwr, diff_pwr);

  if (params.tssi0 > 126 && diff_pwr > 0) {
- dev_err(dev->dev, "Error: TSSI upper saturation\n");
+ dev_err_ratelimited(dev->dev, "Error: TSSI upper saturation\n");
  diff_pwr = 0;
  }
  if (params.tssi0 - tssi_init < 1 && diff_pwr < 0) {
- dev_err(dev->dev, "Error: TSSI lower saturation\n");
+ dev_err_ratelimited(dev->dev, "Error: TSSI lower saturation\n");
  diff_pwr = 0;
  }

diff --git a/drivers/net/wireless/mediatek/mt7601u/tx.c
b/drivers/net/wireless/mediatek/mt7601u/tx.c
index d3328181f961..d88d3fbcb0d9 100644
--- a/drivers/net/wireless/mediatek/mt7601u/tx.c
+++ b/drivers/net/wireless/mediatek/mt7601u/tx.c
@@ -247,11 +247,10 @@ void mt7601u_tx_stat(struct work_struct *work)

  spin_lock_irqsave(&dev->tx_lock, flags);
  if (cleaned)
- queue_delayed_work(dev->stat_wq, &dev->stat_work,
-   msecs_to_jiffies(10));
+ queue_delayed_work(dev->stat_wq, &dev->stat_work, 0);
  else if (test_and_clear_bit(MT7601U_STATE_MORE_STATS, &dev->state))
  queue_delayed_work(dev->stat_wq, &dev->stat_work,
-   msecs_to_jiffies(20));
+   msecs_to_jiffies(2));
  else
  clear_bit(MT7601U_STATE_READING_STATS, &dev->state);
  spin_unlock_irqrestore(&dev->tx_lock, flags);
@@ -263,12 +262,9 @@ int mt7601u_conf_tx(struct ieee80211_hw *hw,
struct ieee80211_vif *vif,
 {
  struct mt7601u_dev *dev = hw->priv;
  u8 cw_min = 5, cw_max = 10, hw_q = q2hwq(queue);
+ u8 txop = params->txop;
  u32 val;

- /* TODO: should we do funny things with the parameters?
- * See what mt7601u_set_default_edca() used to do in init.c.
- */
-
  if (params->cw_min)
  cw_min = fls(params->cw_min);
  if (params->cw_max)
@@ -279,22 +275,18 @@ int mt7601u_conf_tx(struct ieee80211_hw *hw,
struct ieee80211_vif *vif,
  WARN_ON(cw_min > 0xf);
  WARN_ON(cw_max > 0xf);

+ if (queue == IEEE80211_AC_BE && !txop)
+ txop = 0x60;

  val = FIELD_PREP(MT_EDCA_CFG_AIFSN, params->aifs) |
       FIELD_PREP(MT_EDCA_CFG_CWMIN, cw_min) |
-      FIELD_PREP(MT_EDCA_CFG_CWMAX, cw_max);
- /* TODO: based on user-controlled EnableTxBurst var vendor drv sets
- * a really long txop on AC0 (see connect.c:2009) but only on
- * connect? When not connected should be 0.
- */
- if (!hw_q)
- val |= 0x60;
- else
- val |= FIELD_PREP(MT_EDCA_CFG_TXOP, params->txop);
+      FIELD_PREP(MT_EDCA_CFG_CWMAX, cw_max) |
+      FIELD_PREP(MT_EDCA_CFG_TXOP, txop);
  mt76_wr(dev, MT_EDCA_CFG_AC(hw_q), val);

  val = mt76_rr(dev, MT_WMM_TXOP(hw_q));
  val &= ~(MT_WMM_TXOP_MASK << MT_WMM_TXOP_SHIFT(hw_q));
- val |= params->txop << MT_WMM_TXOP_SHIFT(hw_q);
+ val |= txop << MT_WMM_TXOP_SHIFT(hw_q);
  mt76_wr(dev, MT_WMM_TXOP(hw_q), val);

  val = mt76_rr(dev, MT_WMM_AIFSN);
-- 
2.55.0
