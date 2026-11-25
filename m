Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795639094;
	b=N8LVtbBSCIWcmCRB/v/E47i4T/vfn3YyZGEVoIYCD3F90KvnZtR1CCtSTJ5dp2SXgdxJ
	 O922ScPdXr2F2NDyTJajPF7VsUNnYdeqog1yRRnOOy8gtDYVc7GJaGTsjflpZX3ES7TTV
	 SiBgtNApRzsCHLDmnZ7dR7FUMTROyNi6qNqnqDOomiqkvfl/LbYPx5aNL/2OHHmdczGQG
	 9vvUrpEfGHPQOjBvNieGZUZSIrJFEKcSSVxx+OPxEOLBnYFYSeX4ghWQKkGOh2KuuA2lx
	 5Pdw9gJVQfLna3M1iTfjKnCQInx+6f2quOLUp16XbCzW5vUGxWwp0TC+H3LTeiWZPsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795639094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=MOLrrSGpfOvCRTdHbo19fWlRBL5HLF65kXhbZO1anXo=;
	b=o30gl1hpqsg71LW8reJOAzr5ljfmC+yFmOWOOB0zw40zuKky3np51SvnIUY8u6ieh7XQ
	 uAVIFtynf9O86XsU8+RcU2HmHqOYGaEGqJ5ZjDnAtME0n3VJA/Fki02HQW1HCqRdhMvWm
	 gEpRZdc5V6H0peMkBMpWRbywV0Q/CD9tF9ZleIsV//qT6xeh4JF5qiTE7eaXmJ3xzGzZ6
	 2ftf7bJUh89Civ7XR6gsXrhQAnxeOTWpAPZ6a1qt/EfO34ZxUVkp5Oqygs6noCHikN/Zv
	 aw7ITPAaPIMwPUmXTI1CYvS7L9PniHr60bheqhtIrL2P2uNKwAUuyDd/Eou3HRjncvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKaHkTYM;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E369606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 20:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E369606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKaHkTYM
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so3167093a91.3
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 12:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795639092; x=1796243892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOLrrSGpfOvCRTdHbo19fWlRBL5HLF65kXhbZO1anXo=;
        b=wKaHkTYMkPponA0AEVaZvEw7DJq5OaFNbRZiWtMwWb7w1iyF7+Dmo371gdqCFfcIXU
         gPJjJnqiHKl5dpJyfoJMw3AZ1XyfrGUQUmY7ElnmJYtgJS4igNzJJVV8xuBXbFGXflEP
         evdeYZTB321nf4kunLvxRNm0hpMCNbY81REs+X0udDjqmXKSxFTySEcFscOGxjygHWTL
         Wqx80wxilWJ/3F3wJQ0u7/2H2BMJ1HRj95yw07brifloVBq9M7J65O7guZuj9RTeZJ+j
         /0calMro9nDSMgjCocDQxnQh3g9Odxc59ra5RejW+0otU1g6VleXt6EEQ9de0Q4Ktux9
         0TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795639092; x=1796243892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOLrrSGpfOvCRTdHbo19fWlRBL5HLF65kXhbZO1anXo=;
        b=BUNHeGbIAbKLJW9Q5yxFiQ/NO2srQ/S4VfwYqqZ37WXQf2PhiXRWQ/2ZdVJ6XnVxAz
         zTsWB5KOqjIME9yLJYd7kM1wG/5B1MPhDcAu3xTYCfjg7r8dqznue4Roh0S0sXGeb5GQ
         6Q44jTB/JEV6F3q2aMAf1DPKvpIGRqw3srp9I70ov7gP5ob7CL2hyTbQZa3sIWvHTQ74
         +P1bxuHwyFn6pg0u52HgI/j/Lu2pK5Z9U/t2oCpgRCKklbEH3FzeM7mCrf9FT/ON8zs5
         BtbFunCS5Zm9pmMoRvZivnn8Uc/gWC3kmbpfzR9DmC/jJvwe0hQ51MuxcCqzOJlMm5X0
         mG/Q==
X-Gm-Message-State: APuU4Z+r8SL3v/ZK7XOSnggwxedcG+s/FCpWBESIDSj/XfB7ywyG/7wt
	9Tp2dBtiIX5PWs1nAMIXC1mkI9dMDmHjliMvAxpc5/oSFqrFXxg3qFKfQQI7H1scUUo=
X-Gm-Gg: AZFdTZfZ48J2UpnewaXdS2bkBo7R3+pWXFo6Ij5bRD/EKoqCUha2UTXe/I1alfcQISH
	HuAnpti6C3Vx9FEmtoxzyrTfV1pJR45Ho/eKtBxZFpqIYNxSzwunyTTS1CVoevO/erXK3rm0Ftr
	ZfktQ0o25El5iwjZwfcV2ELyiBiMbinI3/CM20LFmF4M+E4t84yGcmVt+2ZatgYMSFHmwchRUD1
	6hCRbRavnOZuItP331k/0QrVNLSHVwHKXuNWQjLFgh6C5yjVbpuOAlMqsty8T55ooWS10efY0+s
	AItEFkVvdkXEgi/bfJikfIJzSo3loFpx7mS5InZJhgxyPUv3W7faip5k/027oMguk5qUZFJCqPa
	DprFXbQxh/dmyH4082rZWkVkg+7R01j4dwhCxqF4gl0k7Aeck4hBMYPdbPYeCDji1Vl5c9pdhfv
	WYo7GXPELu6zg9WR7RDMoOsEjt08NuwCZckb4EQjjC8GMTMbxKjB03s+e89sinhtn4vp8dk+IDy
	fYDNnpGq5pZjp8WqazoK/rodsIpe0/DoKhL4PdR3wU/Y15QN97U1yu90B1duXAClDcd/AQF62OS
	t/akjwhFkNACiX5AQL7lk6XcgiDfl0cOKTMhr4FFalrzxslFq/kMeiHRtPcDRTr3Y/0lCQMuAI4
	fwXX5L88ctYFz5uqYTYd3/f07GrHrZ8fVRftEigul8YiE5Bscb8LV
X-Received: by 2002:a17:90b:4a48:b0:3ad:eb15:aed9 with SMTP id 98e67ed59e1d1-3b41c7ac064mr16372116a91.9.1795639092455;
        Wed, 25 Nov 2026 12:38:12 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:25:846:8776:e78d:e6eb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm28875632a91.4.2026.11.25.12.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:38:12 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH rtw-next v4] wifi: rtw88: 8822c: validate bw and nrx read from registers
Date: Thu, 26 Nov 2026 02:37:53 +0600
Message-ID: <20261125203753.428868-1-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
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

rtw8822c_phy_cck_pd_set() reads nrx and bw from the chip with
rtw_read32_mask() and uses them as indexes into dm_info->cck_pd_lv[][]
and rtw8822c_cck_pd_reg[][].

When the chip stops responding on the PCIe bus, register reads return
all ones, so bw and nrx both become 3. bw = 3 is past the end of both
arrays.  When the chip stopped responding on Ubuntu's 7.0.0-43 kernel,
UBSAN reported:

  UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
  index 3 is out of range for type 'u8 [2][4]'
  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
  Call Trace:
   rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
   rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
   rtw_watch_dog_work+0x217/0x330 [rtw88_core]

nrx = 3 fits in cck_pd_lv[][], but rtw8822c_cck_pd_reg[][] only has
registers for nrx 0 and 1. The entry for nrx 3 is empty: register 0,
mask 0. If bw is valid and the level changes, the driver uses that
empty entry. rtw_read32_mask() then shifts by __ffs(0), which is
undefined; in a test that faked only nrx 3, UBSAN reported "shift
exponent 64 is too large".

Return early if bw or nrx is out of range, before either is used as
an index.

Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/f6a7d3272fe7635c6a83698dfab5d85500437ca6@linux.dev/
Cc: stable@vger.kernel.org
Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
---
v4:
- One patch instead of two: check both values right after they are
  read, as Ping-Ke suggested.
- No code comment, and a shorter commit message.
- Dropped Luka's Suggested-by and Reviewed-by from v3: this code is new.

Tested on an RTL8822CE with Ubuntu 7.0.0-43. A debug-only patch made
one or both reads return 0xffffffff for 30 s. cck_pd_set() runs every
2 s; "stopped" means it returned at the new check. Each faked run also
logged 2 or 3 normal calls before the fake began.

  Test                      Calls  Stopped  Ran with a 3  UBSAN
  healthy chip (60 s)          30        0             0      0
  bw and nrx both faked        17       15             0      0
  only bw faked                16       14             0      0
  only nrx faked               18       16             0      0
  both faked, without fix      18        -            15      4

The nrx part was tested in v3 (Ubuntu 6.8.0-147, bw valid, nrx faked
to 3), without the nrx check. UBSAN then reported, once in the read
and once in the write:

  UBSAN: shift-out-of-bounds in .../rtw88/hci.h:203:22
  shift exponent 64 is too large for 32-bit type 'unsigned int'
  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
  Call Trace:
   rtw8822c_phy_cck_pd_set.cold+0x15/0x36 [rtw88_8822c]
   rtw_phy_dynamic_mechanism+0x322/0x6e0 [rtw88_core]
   rtw_watch_dog_work+0x1e7/0x290 [rtw88_core]

Not tested: the value 2 (the fake only gives 3), and the USB and SDIO
versions of the 8822c.

An AI assistant (Claude, by Anthropic) helped me read the code, write
the debug-only fake reads and draft this message. I wrote the fix, ran
every test and checked the results myself.

v3: https://lore.kernel.org/all/20261115201826.181662-1-zeshanahmednobin@gmail.com/
v2: https://lore.kernel.org/all/20261108182837.682661-1-zeshanahmednobin@gmail.com/
v1: https://lore.kernel.org/linux-wireless/20261105113415.73184-1-zeshanahmednobin@gmail.com/
---
 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 09315d23e2c4..830dea8169c5 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4406,6 +4406,9 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
 	nrx = (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
 	bw = (u8)rtw_read32_mask(rtwdev, 0x9b0, 0xc);
 
+	if (bw > RTW_CHANNEL_WIDTH_40 || nrx > RF_PATH_B)
+		return;
+
 	rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=%d nr=%d cck_fa_avg=%d\n",
 		dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
 		dm_info->cck_fa_avg);

base-commit: 8b29fd95e2d3cb80564eb7cb34248b844422ba1e
-- 
2.43.0

