Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371173;
	b=dkUR6E/MEvPu1UKG020dtNlhLRVcsMut3z854hPEc9VPYoiUFS0XL0Kdg6DEVoviwgAR
	 dfBmnhQdnC+jj33RB8pjJeUcg7JK8X2Pp4MXe09FQCUtTK81XIL9QwTQxRE78onndMwZ6
	 3UhmeJLfE6EzENC1tJ4nnFroHNErtImM0nnbeYl0K9cwwBF2qmEUchE+WWfk9BXp8qWZf
	 TB4DdyEDMek+yKRVkkDLn6oyqO6vOoUX+JAgSnV53b3vKZLo/3ey42xloHtePQZtuiRMJ
	 pOxuhZtfRY8YKgmYE8Ohje41hQjvlefoKbVwWGZP/JL/AIHuwEUHJUsfTlToAix2WmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FFlOFP5DVT2Rk2YGKhSaGCUCFiztJA5CULaLG82EQoY=;
	b=TV3SH/HxBJm/O31qEUVzKR5wPLSqMnY2KG7XmVD0+wCVXCjgQK/7SIRfQou0N/ow1wmC
	 v/X6EepLV+9xCTxvrcbi95RNLem3LtzlY7dCz9wxasdFcFzWFEiuuWIxq6EndB3CCxba3
	 bmgtdlKfN4RpWoM/MLd48wwmCIxfe97JTXQ5w0IOq4guevBhYsX2R03qjUlLIlVLhh9W/
	 ZfY9XZsSkL5oL5yLFl+AjiJdziVGGmRLmzi5WqcaztotCMY+fXC3KBL/i41PF/XbQrinF
	 lsHD7JiSZPX/aReZLLtgcwXOgWi/c4t387qmeMN/kWpX4EdNIDHBHzr6Q62BSc84JHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kX1dQBmo;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4F9606A324
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 04:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E4F9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kX1dQBmo
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1313483a12.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 20:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371172; x=1794975972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFlOFP5DVT2Rk2YGKhSaGCUCFiztJA5CULaLG82EQoY=;
        b=kX1dQBmoYUkhbQrT7/D3N5Fn3oralg9sdXpphgMzbyT4+5fco2MC5NMFsqhqrOfEY+
         qlBPX11ZfnXdfFl1/UhZOUry18CXbs1dBm6XOgqEff0yDNDERXfXrDjBYbR91ExvuSnU
         yqrihLZK0RQi2zzXVkNDNniEDkGQvgFhRahk3RfSIk8m8dcdD+zNQu82MTusmM29ZoEM
         MFgCsMzOiwQ7q6xOP66/o3juw4J68IX6rD0CF4OkkakPrewiVeSXBoNmT7/WdLsuB0uR
         91E2ULWgTDXfmLrWTZDYx/exFJM1ecc4VkKzPrWL8lntQJlt/WxznE7mAAEcdWT2Nfwu
         MB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371172; x=1794975972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFlOFP5DVT2Rk2YGKhSaGCUCFiztJA5CULaLG82EQoY=;
        b=E51UV6T8O23FVMHgHkoL53honVSQh6etVI8w6HuTr3EHQzhuCfOmQ6SeWVO9WasBhq
         rNldbFF4WeE36gFRtK0WJaqQ6iiyyrYmBCabwXa6UJAFCL5oiZBb/EsXYCFF68GtTbUY
         CZEtjS23Z+oULsWUhazS/342k1/Tw0I4dBs8Lu2VogOdkWl2oRVWFy36AuA+PKgk6YPC
         7FINK8TJm49VrGnrhZ8ePuQem8brCacOqewXVSMKc3vKJRT/UWaJ7rPj4JTXSC84jj9K
         aZqtafWoEnXodQcX5xLXNEmamzazf4eEuI/X2y2l86oO1neOyaRcCkOstWKEHTvpMsTm
         0s1A==
X-Gm-Message-State: APuU4Z9SxeM4s8CjV9+L9nlqE61crtXDj7oP1U1fh/H6s8v4yDDvKo1Z
	fhfo3QqA0mp0ek3chDvoTzkWV3uioZr6BGTVb5CkxuraaG4SZyTmrBDK
X-Gm-Gg: AYBFou0iZb0FRTsNyKO1toqFfbdEI1n88nlp9WpI2+T/2dy0Gc+XrbsQCr8BlDzG8iw
	9CoAfO6tFaDmxB1HMp0xv8zXEXzV1YLHBylZbG7jpYhPTV9QwSZr+RePCtr0atqgle0KVy6lx7+
	zJXM5Zcf/yTvtXOGZhkaVePsoGDSTLVq/vKRAne108RlnIPcufW06MpLaeCV3t5rwltygMQqYgA
	86iu11DLf7mgXqM/gOiaE/319AFB4HpGpOJTldVGrn1obl3vXr1D/ut9unFTu71516ToLAEZZ4Y
	BphUlsH68YbHBtwCG4wnvdX+i/je0rV/bG+yUeFr0hqba/FzWzbvvQfyEmnTg6ljvDWStBjfFqO
	/MhBQWkMG8G6a6ArFYbuMPUc6VlgvJjUwO75f3DkjqQYGCnrqeJ6v5sE/NY67m6Die91bcFy4/b
	KBMdFimyOuqI3CtrGbHUhwvqhK0mwSkRoV51nKwrxVPN2g0kEN0yWIqX/hnFUewnR9GEw6qvGig
	T657d6BtVfZxv83d5LAR6Vqj34rH5CMpC48xoxg1TjVEnAMSTuRfVc+cwF2d5nYm9PdFGJ9+6/G
	/KxofuDk4d8BLOUpTyx5FlhkbW7Ma/YL9TAlAMi9Xn3HIEQ5trBj0MXMvCb6q2pnXZclJ3cTihl
	eu/+PMPEk1igbiDyLsJMx3wJEYf+udfTf67He2NZHAbYlGZSPuuSoJGuvp+Ks2nkf736zyY++Ju
	Yvdgc=
X-Received: by 2002:a17:90b:4b84:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3b182f2862cmr1142659a91.33.1794371171647;
        Tue, 10 Nov 2026 20:26:11 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm2473927a91.11.2026.11.10.20.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:09 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/7] wifi: brcmsmac: embed fixed-size allocations in brcms_c_info
Date: Tue, 10 Nov 2026 20:25:47 -0800
Message-ID: <20261111042554.232998-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

brcms_c_attach_malloc() allocates struct brcms_c_info and then a number
of fixed-size structures that live exactly as long as it does, each with
its own kzalloc(GFP_ATOMIC), error code and kfree(). This series embeds
seven of them in their parent structures. That removes the allocations
and their OOM error paths and, for the per-band state, the open-coded
pointer arithmetic that carved two arrays out of one allocation.

Patch 1 embeds the per-band state arrays of brcms_c_info and
brcms_hardware. Patches 2-7 embed the module callback array, the MAC
statistics snapshot, the default BSS info, the protection settings, the
core state and the BSS configuration. Patch 7 moves the definition of
struct brcms_bss_cfg, unchanged, above struct brcms_c_info.

There is no functional change. The pub, hw and stf allocations are left
alone: embedding them would touch most of the driver for little gain.

Each patch builds with W=1 (arm64, clang) and passes checkpatch.
Compile-tested only.

An AI coding assistant (Claude Code, Claude Opus 5.5) was used to review
the series, resolve rebase conflicts, write patches 5-7, and draft the
commit messages and this cover letter.

Rosen Penev (7):
  wifi: brcmsmac: embed bandstate arrays instead of separate allocation
  wifi: brcmsmac: embed modulecb array instead of separate allocation
  wifi: brcmsmac: embed macstat_snapshot in brcms_core
  wifi: brcmsmac: embed default_bss in brcms_c_info
  wifi: brcmsmac: embed brcms_protection in brcms_c_info
  wifi: brcmsmac: embed brcms_core in brcms_c_info
  wifi: brcmsmac: embed brcms_bss_cfg in brcms_c_info

 .../broadcom/brcm80211/brcmsmac/ampdu.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/channel.c     |  14 +-
 .../broadcom/brcm80211/brcmsmac/debug.c       |   2 +-
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |   4 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 226 ++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  82 +++----
 .../broadcom/brcm80211/brcmsmac/stf.c         |  22 +-
 7 files changed, 138 insertions(+), 214 deletions(-)


base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
-- 
2.56.0

