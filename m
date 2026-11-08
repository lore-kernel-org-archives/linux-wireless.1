Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162571;
	b=RdtrDciFCesb49ituxW3XVFFl4Jt5pxtVzzIXhaTzy9ILf7sDHninldPUcvBJ3SyFfP2
	 C6hoH0FkXSJP3X46Vd+kevY/eRf6KL32A5y464KRLIeWzk6wm6rum00jVayFH8jyNgndp
	 69R8nTIUCdphk5l8bvIhi+PxDJh15oEYdFWL6EOp6kkRrR1H0FCr7fXI41Ek0srvispWa
	 j84JDj2JHQVpuLt7N9HTok1Dc8Kqt6FDVAT1FqaVz4S9vMdNWgRT2uA3CJjn/wKP53jL+
	 C3m4JsGgoOoaV1GS70g1eBzGiiVyiUKJuzXzc83dD1cz9fMpCara4wWMvCgl9WTl3KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BzkQiIfcLEfWegWq0FERlNVk/16k6R+noDnnrMFOSWI=;
	b=qeKtWK1cSGwXw/QC58Eu8riEIs7FTLO2egvrlzNgH5pY4O8EUibrzC9A0fk7dtebm4WW
	 NAO3If9hiIR0umeOtRg1fbv6MR/QJzyUNonPooiRthYW6yH05ffl6QM2a2dyOZV/mVkqf
	 61mKJ/3G0yQoDsbHELIXH5Nb8+ppbEzw3E36P8fLwZC9dSZpIn3P8smSR3uMO8BhUgUmw
	 +AMeu++Snkgbtp0mDBRS5sFaGEuzuDF6MuWOZG4hJxAyfhWKn7BRbNDuIOWpm285rlb02
	 FaTB0wlVWN6qjTIn4lL84K9u43iVhEnq6YIUHCqa6fc8fCHAjQ6+Z3E1HtfqRA1kusw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q62r1FqQ;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F05606A321
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 18:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F05606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q62r1FqQ
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b6399ebb41so159096b3a.0
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 10:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794162570; x=1794767370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzkQiIfcLEfWegWq0FERlNVk/16k6R+noDnnrMFOSWI=;
        b=q62r1FqQ0xmPaFcqn17m9G2It44P/MJ72snHBR5g2fTrpEdhfWsCssekVZOodumzYz
         7C5ieA2AXVSh7jnzqZXvOTLCIzrao38dh8EMA66iYPDg/Coi5TX3W3+h97AdP+mW/w7U
         RbS7vfvfZ5wrgSsRXwn7jJDSH/aCurvR7mfnmeh9Vsgxp9xF1TQg5iIn4j5/R2EZGS4g
         h1DGNkA1z8yI3ixswdzf5ILk4YC/c/dWB1I4+Tn0IVRkt8aQMwEZZ5km2q7Mo9fUVGGV
         Xyv9e3dawLhzrWV+6qMacUZf6Gs/c7VqP8kPLQwsATkYOQA7aXdYiddWLhrHKofQTbTv
         gwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794162570; x=1794767370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BzkQiIfcLEfWegWq0FERlNVk/16k6R+noDnnrMFOSWI=;
        b=HnAuTS47MWOlH0g4VCwIf14EfFMfX/si4RbxBqb6jRgw4vxtdWEtaJ5A4Ma5nrI8AI
         mLS++01zZaJWXHKGHXEU1MbR2fYKP4P9eOevArF/8R9vMe17X0htObuKVwhrDngvudoQ
         jf3qeDtm7FlNhhQ4mDYRwCnyuC/NVn0s85Nj1mCD3pZQiUfWlxOYJraWugjmGosVudoa
         ZsFuGLyoM4vXlXv32nv7gjqml7ldrQEg9APO6cx0oNQzAgcutc3aUAzwDg6MGt4hmeXL
         MYN4sQW/WJ0dp1m9gm+cItH4qoTxLlbPRzVhx7zPapZnXfWo4d+jZJ+bM8k8dXlVq30s
         xiVw==
X-Gm-Message-State: APuU4Z+eBn7c8u8Ja6epPEaUG7V+sFFSeyXnxAYcySYppVjQk87SxIMY
	V56Dcn1BR1BS5VZlcCMgwPvA7Yue3orPFfagsmxEvwSplumZbhmvW7XSjWYT8jza
X-Gm-Gg: AYBFou3ffy8gzpKsYkQEhgUheKd3CbNVRrAyfoss3S3sUAYImSbIq0zf2iWOkmECaEr
	NsMeN5KzvklB2x2Srsg4zqgfU/Ijz1kUy5Rc3IHQ3MCSehr6oyW39bzdTMin9x0c5nVetq1VCCl
	V4AnF9TRHpECvMZC4SgDAsdaTmirf9OGf7EP57Zk4qeG1Y0VO6NuEQ4E7wIp++a2AYK4oXOKjvD
	A07MGSdaIJxKNhWjq9ocgRcB865P8+zikhUx6gWnwmeJ+qGG/lvh26qEj0QLGzbLvTJhFgLNj0j
	zgj6wVHskiBndwWO8YnO6V2Imget5+lbykAbskMjtyiEleaKAf1yXlCWuhaCMl/3lhAXMko/SRK
	gjMAbDjgJzSMqjTXC0hW7uk5wpZ42gxa0MQBACyWktvImtgQbDlQgyBvtGcoF8uzhLtG0nQ+766
	jJv5oC0p4I45wnSkFKIIwywsGRPhS8up5/nomZLRXZgXWElPs8gIq6LTtXkhz51sj6GpCLX//2f
	fsaMMx52qWO6dRvokdsttu6Tp/Ys1ivBnj9fc8HP+aPKgoGjVTn0mOn2wC532/m6c6kcODAEWSs
	gQRuzPMJZMpD/mcq9Mgi1Z1SbS8A1YtpNUC6JTN966NVC44Fi8BB8I2gh0D/drq5lflwYIlNbKq
	ncpuURmfth/RROFB7OXxN6e6Mgpc5
X-Received: by 2002:a05:6a00:1c9c:b0:869:84b4:4b36 with SMTP id d2e1a72fcca58-8b66ee0c6d9mr1873502b3a.16.1794162570228;
        Sun, 08 Nov 2026 10:29:30 -0800 (PST)
Received: from localhost.localdomain ([2401:f40:1397:9:5496:ab84:534b:ad67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b6498209a5sm692938b3a.36.2026.11.08.10.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:29:29 -0800 (PST)
From: Zeshan Ahmed Nobin <zeshanahmednobin@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH RESEND rtw-next v2 1/2] wifi: rtw88: 8822c: fix out-of-bounds access in cck_pd_set
Date: Mon,  9 Nov 2026 00:28:36 +0600
Message-ID: <20261108182837.682661-2-zeshanahmednobin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
References: <20261108182837.682661-1-zeshanahmednobin@gmail.com>
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

