Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793999740;
	b=SCloP2w9ljlo/FKTsXZFx/bmnzUaAjBJ9WQv13WR/VHO5fv3WwCev+YIltmQfd/2ai79
	 aUy97iY393WO5RDyGvVTHtNvLjfwwJ/Ugq2N9sRMG6MjogbuQr6SXsZGQli4V0qEJx4Ti
	 I+afaAG5eddMC0uoWrhNBQ03RoNNFqcouJvQLQT01ERckV9bzdpFLSzISlIQME6pDW+YZ
	 0VimpnAj14ivEyjeOFcnN8FZLk62i8GESjB0mCOsNxY7Q6w9zFsgy89wk69kAe510W3FQ
	 GykFhiodbikByvVrETQjFlbZgvXjQuUAWDH4w6zaHB5rOQt9SR5VizrHR81RHvX5VYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793999740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iPNIeXgX2T4OrMflEE5HyV1UINBwuHr5/ci2c5MyX1k=;
	b=B+vnE3kQBdZD54vorIehRcbXMrp3sW8ah1dcQ9rEfNLkawAU4RfqhXTKAEdJbfwMARP6
	 aehAVohn4VCLLnUZQrz3IoUof42rCo4GFo034C0jhxFxozYFPv+lpu+Y6TMnvv13aVOcm
	 ua4x75YQ8IbiYKzeHg08BfADkKdH0SKzjcI9iFbLw9KHRJ+GjdH+YbKyuhE42fC+v5Kmf
	 CvTT9EeRY/WjdCYVTHk4SYuywy56cDgGfAMcqqu+S8kVmuqI2mMt7d6ArlmvlgLO5t155
	 nH3BlDkyE/EnKBdxtXpzWz9VOHRsSeXgBzprR1YHMso2pLnBvp60Kzb3eKYkKiPpMPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbyPlU6K;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5109B606A33B
	for <linux-wireless@vger.kernel.org>; Fri,  6 Nov 2026 21:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5109B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CbyPlU6K
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so11273095e9.2
        for <linux-wireless@vger.kernel.org>; Fri, 06 Nov 2026 13:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793999739; x=1794604539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPNIeXgX2T4OrMflEE5HyV1UINBwuHr5/ci2c5MyX1k=;
        b=CbyPlU6KtgyhW/8q4o8pnCY0kLDDAWaocGiztySz1mCWaovp2l8lQLUkPE3/3fcIHC
         EHGmnmWnY6jZlFanlZ9JcXifrvnyUrjGn3QIIjc++Bb6hc9uqDcopRtoU0svIJxW2PYA
         VG7TUejMz7dNfpm3wmNReaJXHLgyIgeJkESRNbqrdiOqB+A/SJgd0vIeg1p/13BAn240
         j1F40+BA9Cbw/vTjIgnojCeBtDVTN4sft5k6prPYRzZQ7CNahLLx0h3td+qv4+FXhXjM
         lsLYfUO8w3WbabzzE48ffOiQ4lk+hxJUEXIS89ZZQDGXTdCdDPbnIsqs/5bpVwhIjPmz
         J3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999739; x=1794604539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPNIeXgX2T4OrMflEE5HyV1UINBwuHr5/ci2c5MyX1k=;
        b=ZcUGXxtLbQkc/1DWiRmuvm/zhcaEjKY73N5PlS7St4S4OXYDcFJa6lS3rMKNVlHY/S
         ChT+7d1FKNks36594gcBz2xvrGuzae1XAvgs0CtoQnzaNtb8jSsyPdkPKQA6UcwMwcdZ
         RvWu3FYHdPknHC9ac7vhLQ1wfBljXiBeq1pNIHgeLmtCEeEyiL+vwjw+VdLs+45m0f1g
         /WZ2eOeKjvpN7+n+lvnFKHuND9Lhn9nzqirmlbCfAPCVEfBXWGVoptaw6qo1tPlOyLm1
         TbfLvfNAZ3/bABxLAzS2qLMCC7qktG+YrdZVSHei2Y92kcVZ5+i3WmNK3Mzt1s0UWCje
         XylA==
X-Gm-Message-State: APuU4Z8PuLZ5pw9wXXxn/0Iz/xqd5JTl2Tr6DsJOkxfVCY6gacsgj/fi
	9tQQdTSEKVwJDkeEzpOWktDpqSUurGakhIYLdyfkk/3BTcmB1PSqekX2qCE3DwZA
X-Gm-Gg: AYBFou0lE+ffG77LrVCbUGKKlIkHXaupP7mth7pSWsdJy+kjbtT2rWfC0Aeku9HKkAc
	a6q4y0OdvHr/ItIxLQ+WUy8ec5ixs9YowFfYx+iMrX+0E0QNnd7I3OSmWuH4pbn4Qkflr23iwUR
	m/ykjJdQ6MmRSiVvuigCocGJ8CyRL2QqxYketIENw6STXiur5cKsuli0Gs30cfjvP2ZuNqkKBDF
	od9zo1wkLfWjEYX4eBJTWr/+o+NRcyPyqHSzCqa3uToFFTpQ/y4QxBD1KK1u1J96DIjW0mk50hb
	fgl8IwB5T9YbiGlc+QXP1u8LoMjnkbBDptK4yGroDvVAGL7RO8b+B7KlqHNbpqMx2TvTR4wG7G1
	C5g17wjBmwevgtJTrZxqfkYdh/DPfnWtxPXdaCaIgPhaEN9KPtxr1aVdGFZLa6F+BluBx172MBS
	m8hOH1/VKl3giB5aavvyIJgV312m96SfoLt5RZ3jU3RDcBgz6AP6hWzaqiMkdPOUq584PSMRFrN
	ZlWkKiuUXb08ttQzMNTiINit4qVg1yWqk/QVAUroAO2SQTJz2pxCCGxb+2Oi5RvpKD0N9V3afub
	2ijjogUWPj71bU5vJ0qB93+Nzm9kewh3qFLP3FwB8AebczuQolU=
X-Received: by 2002:a05:600c:314a:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4b6de4a5dd4mr65782395e9.9.1793999738570;
        Fri, 06 Nov 2026 13:15:38 -0800 (PST)
Received: from luca-HP-ProBook-650-G1.lan ([2001:b07:6454:c33e:970a:d82:3e9:48ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm18070765e9.3.2026.11.06.13.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:15:38 -0800 (PST)
From: Luca Casati <luk00casati@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net,
	arend.vanspriel@broadcom.com,
	b43-dev@lists.infradead.org,
	alessio.ferri@mythread.it,
	Luca Casati <luk00casati@gmail.com>
Subject: [PATCH wireless-next v2 5/5] b43: N-PHY: add the missing override to the rev7 TX_PU command
Date: Fri,  6 Nov 2026 22:15:16 +0100
Message-ID: <20261106211516.273791-6-luk00casati@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106211516.273791-1-luk00casati@gmail.com>
References: <20261106211516.273791-1-luk00casati@gmail.com>
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

brcmsmac's NPHY_REV7_RfctrlOverride_cmd_tx_pu also sets field 0x4 of
rev7 override bank 2 (REV7_RF_CTL_OVER5/6); b43 left it out. With it,
the override writes match brcmsmac and the wl driver on a BCM43228.

mmiotraces: https://github.com/Luca00casati/b43patch/blob/755c2d8/traces/excerpts/patch5-tx-pu.txt

Found and fixed with the help of an AI coding assistant (Claude Opus 5.5),
by comparing mmiotraces of b43 and wl on the same card.

Signed-off-by: Luca Casati <luk00casati@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index ab8fab018..b4fdafabb 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -220,6 +220,7 @@ static void b43_nphy_rf_ctl_override_one_to_many(struct b43_wldev *dev,
 		b43_nphy_rf_ctl_override_rev7(dev, 0x4, value, core, off, 0);
 		b43_nphy_rf_ctl_override_rev7(dev, 0x2, value, core, off, 1);
 		b43_nphy_rf_ctl_override_rev7(dev, 0x1, value, core, off, 2);
+		b43_nphy_rf_ctl_override_rev7(dev, 0x4, value, core, off, 2);
 		b43_nphy_rf_ctl_override_rev7(dev, 0x0800, 1, core, off, 1);
 		break;
 	case N_RF_CTL_OVER_CMD_RX_GAIN:
-- 
2.43.0

