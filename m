Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794076508;
	b=XqBohwNdoKJxOIcZcY7/u1jo5pBIVVDv04pORBk9b63RmqojhD2k7cG0mdYNJYSS9xc2
	 a4uYphiCrx5zlBCtzlNAkSSaff+K37KdBY72Yj/zuwzyxCNcicdISz9Z7s8vY7zkWSy5r
	 JJBfLFC0QQrAoEhC1x8SS7Po+dYkPiTQzilAV011/3y/r2c4jJUTWT7or8xl6ntsslIEj
	 gupuXpUH4jQ9+N1oY5/Ep/Yy6BKWsJMre3CDwz/7xg1KvNXgzj90jWGT06Oegp1P5DS0b
	 +BjlMxLtb1Ze3mU3Gtdw8FIfAGcCyvyDKsV3rm7fXY262XcfABSbAGjmUkjfytW6QQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794076508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BzkQiIfcLEfWegWq0FERlNVk/16k6R+noDnnrMFOSWI=;
	b=A250QWKilagMHILgQnxo5NXr1HG7JLSX953TSniE2sCbVP/e0hfNC8XLoVmGOMtR1Y/O
	 Uwg4ULWF5Dow2MLKZiqH0vp9HnALGcqhH5wJOrkPZLWj8f64pkp20i3/4Nud5kbPM6lKH
	 ByyIiXyG0kw9r2WfcklaauVImDkKskelu2KIYOg8os287s7RTSY/pYQ7Rj4Qf8ULIjcqW
	 yQx9x3dS/SDbmzmD3+Purj+DolV2g49uFDuxQncRgbYWrf0fkXJkT05XF1qfwTje4XpKN
	 BHqqqcVS4x1pYvPupo/eIUUOQxHJgUwsO//FEa/d1eyjrqp/xU587Y0xSdUdIX/9nqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxdhNZqf;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4832B606A32C
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 18:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4832B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nxdhNZqf
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a070781f63so641567b3a.1
        for <linux-wireless@vger.kernel.org>; Sat, 07 Nov 2026 10:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794076507; x=1794681307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzkQiIfcLEfWegWq0FERlNVk/16k6R+noDnnrMFOSWI=;
        b=nxdhNZqf0jIJ3vOJbay//p1lSgOb4Mkz1U94EOgbMSG7OROltnE+UlpoODfYiw0Ano
         7XD69ONseuWTIsQMELC6cpzr/Q+aY37cnEzSkremdbs8CBhTzuUzZMEtAZKgmjYcKVSS
         zhOIAAdzyHJNdzSa73eKzPz3mC2kCOxjf84XZV7vbVeHdy2/wMGKFdIuMRYm1IR5X3a+
         otThv5OfKPhBVrIyye5TpojCgoudnsBoAcDrYhe9CB5xdrPs4YnNuEylKfkBsmsxij3B
         FKWwglZmO4IBKYlpgEEb2sPlLX7cdZSUS7omkkccMzWA778GgTWJ4LVBpOxDhyRFNj0j
         FlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794076507; x=1794681307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BzkQiIfcLEfWegWq0FERlNVk/16k6R+noDnnrMFOSWI=;
        b=WcBOwikckQPU4tgfa8H5LqbTQPxjswi1PRW5uDC8ofAVJ1hqq/KZBqfi2xsV9/4c+8
         1U1bNp13Qt0se9RdmNWP5dBn1KyQJ+g5K0KP702yOd4ZcT9/xlgoC+6trE0CaOFkyy9H
         RWTgvn7MTdpBn/xuwmPw2X+Of9OFk7fFJkKsr2clH6Tj5y3lAgVITvpwBf/fEMMhyWs6
         g7WJa0z2/RGO6FmOMc6J3aIOK+E+E+F04ycS3eo9iZlBrHkf8yzi4C+ozSt9KbVRIvF1
         8VEBC/VQt6ilD3DLGKcnBRJ4u8XEtJ/9dtnG7PfLKROhkTeO+tMwAqZUWBQivdHQeWi7
         lXAA==
X-Gm-Message-State: APuU4Z/Jq8n+yJZzYglbPAKx2fyRQc/1u5hyVHIUoao+jA4iCiGFWSVB
	tU94c5/+GOEfE3pmWAn25Avan3jYRUoh23a68a2QMIQ7td/OhoDT38tASAR0cmoS
X-Gm-Gg: AYBFou21CQxUO7FpP2jbbJZ58C3Kj9xKA5HdTPaExpR4Mxb3Gouqh9ZkyHhehq7z5Gy
	beWDqTiZ4zmOQLF9KczvMVZVRWQvGa00qMr8P1ilGAEarl4Z5pfImN/bSOh4FEacmfKZNpcBHWK
	08d0fMyTc8FsH0Bb1SFulaA2nHJQxHeKAzyhwMuqDY9CmtsKM5t0WF5U1iY1klPqwTs3ou0s4bz
	ZaNkYMZBNedU2FGXIfhe/Eyd70U6QvHAiDxVuonrcGJMoy2IlEVNTZt+zUMY3PuiJjdrG+3QW5W
	h5LI4nqyt4PmXJCgT+XNrCa6ey98bNNdl7QU6tGypptoiLUiFBxHCaydGa3nkpCMbYyCF9MbBRH
	Gx417KftGS8cRDN4pA0fskKcJr+TnYyG8+YtH/5B9ntDjIuDqIIPE6oBEUT+Y2bKkKggBpgsxFc
	eHSdR40oajYSmIrZxMxm3YOPDen7VmkPm7HFThHrDOXimijGYRl4xT/rR6dIiwV4N9drI+TgZTa
	43tahNDpCWEmVI7DYigtMPeMM7MvrVQeY5NWJhpMgK0UIivTCcaf6tT2tsW7nkYH+8sXOrmBPCk
	V5s0ub2/czuGmZB6R5jQWb6UZ6DFXNTSP+gVPaYsG4WsDXdlv+H/kM23wW5yJ33EvGSWNLt7Ywd
	Ij3hWWKovdioXgS/ye0drpSMX08Y3cA==
X-Received: by 2002:a05:6a20:918a:b0:3e2:891b:c53a with SMTP id adf61e73a8af0-3ebb2aae1ffmr7721152637.64.1794076507499;
        Sat, 07 Nov 2026 10:35:07 -0800 (PST)
Received: from localhost.localdomain ([59.153.103.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35921db07sm1332019b3a.15.2026.11.07.10.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:35:06 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH rtw-next v2 1/2] wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
Date: Sun,  8 Nov 2026 00:34:02 +0600
Message-ID: <20261107183403.50696-2-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107183403.50696-1-zeshanahmednobin@gmail.com>
References: <20261107183403.50696-1-zeshanahmednobin@gmail.com>
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

Return early when bw is out of range. The chip is already unusable at
that point; this only stops the driver from corrupting its own state.

The fix and this message were drafted with an AI coding assistant
(Claude Opus 5.5 by Anthropic), then reviewed and tested by the
submitter.

Fixes: 479c4ee931a6 ("rtw88: add dynamic cck pd mechanism")
Cc: stable@vger.kernel.org
Signed-off-by: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
---

Notes:
    Testing, on an RTL8822CE in an ASUS TUF Gaming A15 (FA506IU) whose chip
    intermittently drops off the PCIe bus:
    - Without this patch, on Ubuntu's 6.8.0-147 and 7.0.0-42 kernels, 22 of
      the 23 boots with a chip failure logged three UBSAN reports for the
      reads, the WARN_ON() and one report for the write; the other logged
      neither. Boots without a failure logged neither. The trace above is
      from 7.0.0-42, whose line numbers are three lower than mainline here.
    - With v1 applied to 6.8.0-147, 5 boots with chip failures logged no
      UBSAN report and no WARN_ON().
    - v2 on 6.8.0-147, with a debug-only change that forces bw to 3 on a
      working chip: in 12 s the function ran 6 times and returned early each
      time, with no UBSAN report and no WARN_ON(). With the new check also
      skipped, the same input brought back the UBSAN reports for the three
      reads and the write and the WARN_ON(), plus two more for
      pd_lvl[cur_lvl] and cs_lvl[cur_lvl] ("index 36 is out of range for
      type 's8 [5]'").
    - Build-tested on rtw-next (dc16902cad9c) with W=1: no warnings.

 drivers/net/wireless/realtek/rtw88/rtw8822c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8822c.c b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
index 09315d23e2c4..6343568285bc 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8822c.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8822c.c
@@ -4406,6 +4406,13 @@ static void rtw8822c_phy_cck_pd_set(struct rtw_dev *rtwdev, u8 new_lvl)
 	nrx = (u8)rtw_read32_mask(rtwdev, 0x1a2c, 0x60000);
 	bw = (u8)rtw_read32_mask(rtwdev, 0x9b0, 0xc);
 
+	/*
+	 * cck_pd_lv[] only has entries for 20 and 40 MHz. A chip that stops
+	 * responding on the PCIe bus reads back as all ones, giving bw = 3.
+	 */
+	if (bw >= ARRAY_SIZE(dm_info->cck_pd_lv))
+		return;
+
 	rtw_dbg(rtwdev, RTW_DBG_PHY, "lv: (%d) -> (%d) bw=%d nr=%d cck_fa_avg=%d\n",
 		dm_info->cck_pd_lv[bw][nrx], new_lvl, bw, nrx,
 		dm_info->cck_fa_avg);
-- 
2.43.0

