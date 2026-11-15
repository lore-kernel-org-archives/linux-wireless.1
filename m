Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773991;
	b=RuhiYYRo4YZccNGBKm9pmzh8Vmfodi6TFjcOrwpls2xZTHhiynVySShLdVyzxf/EjKQh
	 f3mPo+B23Az87uxU+6h0Zu0RUVZ5RbpEaYakk6ddYd3biwcfZY5FGDQjOeuxBzpnb3Rg/
	 6Sp3xy5fUIWvEh//4cDZkLe8rDJ594Vou4CwvGcBRsZfrdrqSvetwIma1kru8IOxHKhBc
	 HeRd8okuwYcvtpWCSoaMcDi1Nbrh693a4VB6Rr56/ewnWGeOjdxKnW6K9GGTCv30Jbagg
	 bG64TlLgaR0Xzg4SeUFakClx117bcDQs4VAxPbXDurX3DkrK8TRvVsdODyVX8CoU7JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Msg8sO9VRukA4Hei2D5lHVguxjS5HyhmixWnygOYMJc=;
	b=O5OMtGiOFtNQ7hNu87I53CKEPPPoEjO34Gai6iAzQj5G8fKjRqtBNi5QPvEXYZTNo6ep
	 E1rMhmJh0P+pavrZOKZyE0+AI2dW9xBlhxQSV7wk3ZtbBiFbmADfGhG/p0WkfZvDb6Zns
	 lrceLgRqJTpft/Qi3gjX8m3UqrGJxJq/3A1hi6QFk5DPVvFkwGb7Oxs+hW33Ea3qKO+Jz
	 n7f5s7CkRpQDX40IpWEuQ60ZMGnrYZxveSRBC86/p/C7xBBw4qP2MkHxHZ5e9CVIfwpCU
	 G4vH5T9ala3SupcsxdPZ4VDyKJBccUdHcYLQpYRfX6XPDpxmQmvUXylDAokk4szTPJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLOUKAeC;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E21C606A32F
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 20:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E21C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLOUKAeC
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso2278954a12.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 12:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794773990; x=1795378790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Msg8sO9VRukA4Hei2D5lHVguxjS5HyhmixWnygOYMJc=;
        b=PLOUKAeCcQCQz0M/38Om3SvXG9D8b3doQaR4rhA3f+xlRDg3tlh9hMGBV6Xt1JkRi2
         LHAxn6i2FUohto29FXr7Wr2Wf+cYsoZHX7JXejTv6WwfuvXzt81XE874jec0MDn6sY5B
         oLpJHcVhi7IFJ1vyDO5rdBPKrOBrRdDH0FBd73+U2JNa9I4xX3PcXJHPa58U99dZUhX3
         y8RRGNtGf7efftcdJbsPNeQCFW/0WMwpQJIG1rQg5GaTbaNE+ILgr3KGQNhxA7elAlTD
         Y+AFDkga2b9H0f92owOE3B3yeGRLTreCjg7k2pT1vuFIYSGW5J5A6NLdA5vRdhQSs1lH
         unnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794773990; x=1795378790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Msg8sO9VRukA4Hei2D5lHVguxjS5HyhmixWnygOYMJc=;
        b=U49Zg+DsNuJR6mihMK/p2hj1BSX7mJwMt2ZkcFqHCw2XFMxkrYoVxHZVgjKRT6n6UB
         vJ7VTXoQ5+e8H/lmfYZTV4Hx+AnncCcgMnJnihvg12pSg3aYI3q2PFbiT7NeO3wCdH3q
         hCdZ6gySP7MMqtj4Iutg9twCGhGt9KZT4bTtSixijejQ5ccNIIMX032GvfMGDuBX4ZPq
         44PSvUnLeIdFV6PQh+MiEyZXBYKwgIHxfqvsb0i67x+HWk45CvsSa43I7a4Dohk7vJf/
         95VWW2YFQa+v2FwtjLBfgEwGjL4w87ORWFxrFCrQPCSplhKMaPEghPYYVYmH574dO6IK
         CWKA==
X-Gm-Message-State: APuU4Z+mSv7boOGEnKBubwHnNmjuuVxAu2Gd4ddZJ1lIqpPOs5bJ0bzz
	5hE7GIfG4p3kcT/SUCbIYMhXUw5Jk42bPG9zSr6fiW8b+Os7+PsK1dm2QidZi2Xn
X-Gm-Gg: AYBFou2RiXPSCkjOcy6KgE/PwASJTvz9gGnFI4cxq+LebyxHeaOZK0kAis/JR7Rsd4D
	1yUFndi7+HlGLKw8jj9BczDVajXPqYRRAzm5npWM8vIXUjkFfRuSHnlThrFhBTuRD6o8Hkg1/pO
	4QqHYs7S/S6kNIsSkcZNmKFCt3iUJIAqUWZz/aP0uMwFgIXI7JM4Am0NQ75hktYjEIoaj7fUEPe
	lXZRXqG8jvEU9qtwVqxXcmNFunDXDHTp1AqheWogFIPNDaExyMVdumpmLJJ+BSiT/2f/mmgg41/
	fYcFJn0TfkP1Hac7GsliopwnSs8qW2Z3+toPGvghqJwGcJoMq7WhRC1byFj37W1N97VsU8D1Sco
	T66iARscYb0QWs/hcTrRdCzSLIpIk3S3VGr0IJXWNyyp4mpobCe+Wb8M/DxfxnYGl+uxUqKM25W
	iTxwROY0CPR2s8qFN5983a7fHxOjq0KlibF9JPX7UhaRjyWSqAJYJkpJHyrqnH7RXtd5Vq76fXb
	A866BuWCkOJXBUAK5CflqlgaiiXFt+rNdAhlcFux7A31lWq9OLb/C6u1c8dTe+mFJ3EjfQlNVR9
	uUPxZBbrs7nRcXhmd1uHfhPCF0mGgapfF79e4h+eHKiHHc+UPz+9NPkZFhK932FuhOL+95JvIvJ
	JVV0mk1cwPklKJ1cU5/OABMkyQJOS4A==
X-Received: by 2002:a17:90b:58f0:b0:3b1:4eb6:b3a with SMTP id 98e67ed59e1d1-3b1b081887amr9091795a91.8.1794773990435;
        Sun, 15 Nov 2026 12:19:50 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:c:7f10:a86c:c753:9418])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm13382005a91.6.2026.11.15.12.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:19:49 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH rtw-next v3 1/2] wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
Date: Mon, 16 Nov 2026 02:18:25 +0600
Message-ID: <20261115201826.181662-2-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115201826.181662-1-zeshanahmednobin@gmail.com>
References: <20261115201826.181662-1-zeshanahmednobin@gmail.com>
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

rtw8822c_phy_cck_pd_set() reads the bandwidth from a 2-bit register
field and uses it as the first index into dm_info->cck_pd_lv[], which
only has entries for 20 and 40 MHz.

When the chip stops responding on the PCIe bus, register reads return
all ones and bw becomes 3. The function then reads cck_pd_lv[3][nrx],
past the end of the array. If that byte differs from new_lvl, it calls
rtw8822c_phy_cck_pd_set_reg(), which rejects bw with WARN_ON(), and
then writes new_lvl to cck_pd_lv[3][nrx] anyway. UBSAN reports the
first of these accesses as:

  UBSAN: array-index-out-of-bounds in .../rtw88/rtw8822c.c:4407:21
  index 3 is out of range for type 'u8 [2][4]'
  Workqueue: phy0 rtw_watch_dog_work [rtw88_core]
  Call Trace:
   <TASK>
   __ubsan_handle_out_of_bounds+0xdd/0x120
   rtw8822c_phy_cck_pd_set+0x33c/0x510 [rtw88_8822c]
   rtw_phy_dynamic_mechanism+0x310/0x330 [rtw88_core]
   rtw_watch_dog_work+0x217/0x330 [rtw88_core]

The driver doesn't need to read the bandwidth from the chip:
rtw_set_channel() stores it in rtwdev->hal.current_band_width and
programs the same value into the chip. Use the stored value. CCK PD
only runs on 2.4 GHz, where the bandwidth is 20 or 40 MHz, so the
stored value is always a valid index.

On PCIe, a chip that stops responding still returns nrx = 3; the next
patch handles nrx values without CCK PD registers.

The fix and this message were drafted with an AI coding assistant
(Claude Opus 5.5 by Anthropic), then reviewed and tested by the
submitter.

Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
Cc: stable@vger.kernel.org
Suggested-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
---

Notes:
    Testing, on an RTL8822CE in an ASUS TUF Gaming A15 (FA506IU) whose chip
    intermittently stops responding on the PCIe bus:
    - Without this patch, on Ubuntu's 6.8.0-147 and 7.0.0-42 kernels, 22 of
      the 23 boots in which the chip failed while the driver was running
      logged three UBSAN reports for the reads, the WARN_ON() and one report
      for the write; the other logged neither. Boots without a failure
      logged neither. The trace above is from 7.0.0-42, whose line numbers
      are three lower than mainline here.
    - With both patches on 6.8.0-147, whose CCK PD and channel code is the
      same as rtw-next's, a debug-only counter compared hal's bandwidth with
      bits 3:2 of 0x9b0 at every call. On a 40 MHz connection on 2.4 GHz,
      they matched at all 1389 calls, across 20 hardware scans and 3
      associations.
    - In the same setup, the chip failed in two boots. The function then
      ran 13 and 15 times while the chip read back all ones (0x9b0 gave
      0xffffffff). Neither boot logged a UBSAN report or a warning from
      rtw88 after the failure.
    - Build-tested on rtw-next (04c998418722) with W=1: no warnings.

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 09315d23e2c4..df7df76785e4 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4404,7 +4404,7 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
 	u8 nrx, bw;
 
 	nrx = (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
-	bw = (u8)rtw_read32_mask(rtwdev, 0x9b0, 0xc);
+	bw = rtwdev->hal.current_band_width;
 
 	rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=%d nr=%d cck_fa_avg=%d\n",
 		dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
-- 
2.43.0

