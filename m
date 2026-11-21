Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795271017;
	b=3VJrWojFKC44Uxx68JR1ZtZmLYVt7kdGrt60xBxn9jfYhsNj2QPmhvxSUkGOaWHDTyPI
	 QhtaCj4KC+5GTskvzuaN/MIqCZXRsb0v4muuJKGWAcYbX0VP/yDXTQga352+rk8x4+YAG
	 nD3MAhnx7ol4MA7+EObKm8Ai8DbyK0KVyG6G6DkeJi6UE6EGdwNyYHmg6xZp+hOXPWMm+
	 cH0w+1chjTAZa3Yefb+rnSVanJyA4AKNjUacGWqArRPsQskZI9V/XfeTtRBvIJrV/o+/M
	 a/4bm/T52/x6x/3KWW/e5+mF4icn1ELYYN3gLx1bLyV9p2Yf+tyaV3OcHtSQby1e9Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795271017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GgpdGs6wYexFLhnGl6N5YwJitX2Rvk/QL/OITtCuAhQ=;
	b=c5z28ZeKWxZuz0l3Ek8YFSLP9HdSW4QZ3yuoKY8cJ9VxVVJjuvmHi9uQdl1LQCiyCHih
	 dDkEw/YMBD/iglsJBBAkTOiUzNuR2In43fki62UEy4LizdrGcTl+1MmtmpLDJoPKn3W0n
	 xJVS1SBA3/rYYp8IOkvLUochPBCRHFHjCoYKTp05hC+pzml6ZHGwnp9MyIff6ughVfChc
	 E+lKfWtzrdjXSyCmOPCWB397LraJze6RaD0xAp7uavIbdRbUC/0YJyFamCEbCHRY1YFW/
	 LQ4zlVlT+8F8rGO8NVQ02hL4mCwaigBkfDGn20v+fzOAa09rzod4/pVClzz1kh438Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKYaC4ok;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB7606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 14:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EB7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gKYaC4ok
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3ada81853so2092704c88.0
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 06:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795271016; x=1795875816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgpdGs6wYexFLhnGl6N5YwJitX2Rvk/QL/OITtCuAhQ=;
        b=gKYaC4ok/C2c9lz49B5CysAZhena2jm5Q4lnJiwcV38pm+bhXMSvmiD0LRvYy37stZ
         h6DyiuVQ8zp3ZpMd0hj4AYhsxeIeE8nfSM8o/faZQCgPr2QuoqsqfechgnmywDh6sG90
         y3bD6bDSl/lwQpx0O9BddO+H3WSiN+FkKsvsymXkd/+QXbNa+FNDyxLb1AIMeEcablA5
         JLS5BsUVdlPNBBah6DXVABe6rvysMkxgPKBS+dH6Ed3TR2Tm5znajGlK2jOT7fRiZR34
         1mhNg0B4UdZ5b/rt1Fb1QhLKcqr9iVaZIo9q5ZsVm3eQZMiwJFSkwFsReREVouDLUW90
         YNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795271016; x=1795875816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgpdGs6wYexFLhnGl6N5YwJitX2Rvk/QL/OITtCuAhQ=;
        b=Chv9HPiyhkyLp/TuAJgmwqMRb7/JrUzGa+2N8xZ0bSOWFmrHjrTR+5NSlfMgj3YxN0
         le0sosEwxAcqGT3kWK7+QeoPUGL3FOFF0HbqlWkxxgvGZOoQKF+AYf2e/GpkQm3djdXQ
         542aoccLecnrwHVlvARoEL341K22tFT4xuKi4gEHXa3BSf7KFMj/b9xOxF3Cjz3XVORb
         2+ZOzeLTKXvu5UzweCuVXxqQFGedpmEw2+AHXs+7aJz7H1TjQmLPueyT57EjqbxYAVv1
         Alvgml6jOP6cmBil+ZYtwjpVUB6oOawvNEexnbwJddvizxu9QMGSJEpJ+NWSPotNB+Uk
         fXgA==
X-Forwarded-Encrypted: i=1; AL+hErFxr+EZNDXHtVNX9V7C65cug9w8ID4pKvT4qb/9uvvCDK0Fitjpua4Ie31o3pqPff8t/1y2gnAaILKBJbffeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+HJdCx1ieeWYNElxvSOUlbyOr7qrHIJOU/ZQWQ169LbLkM3+Sg
	vfv+f0fCn0rsWZ7FWKTmISBrijmA1SOu03L6EBPj3lIn/+sGF40YoVmV
X-Gm-Gg: AZFdTZcDJkoUEIAVcWNYq0T7H6akCQsNw91bJm+nw8wZwF+ZPIWs/GsYtMGrucSqz5k
	iI33WS5U/GMO/PTtzlcobWbVBFqyvnuA75d2QGlGO7cwMnZqglC1sbKwCZBv76AWTH4mlgE4X8A
	kXwzoCyCPQLN+D4gNoXuqzwB9qIgDedXSUMdVoKpuny0J2Pt0QxaObYQZrETApKqx5qNEE3esPV
	5hIjm64Z5ewqyqetAz9Mp7LQpYfE+c3f3Z9tCZ9yUBNWzEr/VLA2S+R1ggWUCz2ISADPisAXblx
	c4SwCkkCArYQbTpP605EhPaUSpWWc86PHxo7lgKT7vVVoM6aG/L437trSHBmBJ/lfCiRvqn7bM5
	VCdYaYQqK/z1Wk+62n788vgplUf8LXzJZDsLh79pP/Sord6T+7u5JgGWTfgDWWOo+N3VrAXvzA1
	DN/B5Ik+Zv2ttr2OYWWCEdD45LUFTY4sS1tS6w+/hkocMTtNqbjAddLWVOFOlBTsvO0jMFZeU97
	axZn2sdZzkqkKJcajRSzRCFZ35wILwZFnaQ5G1cAF8TgHxnxnx2jJ1arYPbXdoQDt0uT285kRyv
	ymBGmSr6vv9vtg0LK/dVyuZ3apSsjW4WK7qY4hDTzUaukCGzIXJPBhP0eC4=
X-Received: by 2002:a05:7022:290:b0:191:444:425 with SMTP id a92af1059eb24-1b5567c0fbdmr5704524c88.2.1795271015705;
        Sat, 21 Nov 2026 06:23:35 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm15183003c88.12.2026.11.21.06.23.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 06:23:35 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Brian Norris <briannorris@chromium.org>,
	Jeff Chen <chunfan.chen@gmail.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Pengpeng Hou <hppiscas@163.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] wifi: mwifiex: validate event lengths before copying bodies
Date: Sat, 21 Nov 2026 22:22:54 +0800
Message-ID: <20261121142254.99326-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20260731141600.2-mwifiex-v4-pengpeng@iscas.ac.cn>
References: <20260731141600.2-mwifiex-v4-pengpeng@iscas.ac.cn>
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

On Fri, Jul 31, 2026 at 10:20:02PM +0800, Pengpeng Hou wrote:
> +		if (skb->len < MWIFIEX_EVENT_HEADER_LEN ||
> +		    skb->len - MWIFIEX_EVENT_HEADER_LEN > MAX_EVENT_SIZE) {

One concern with v4: dropping SDIO events whose body is larger than
MAX_EVENT_SIZE (2048) would also drop events that do not use
adapter->event_body[]. SDIO command-port reads can reach 4 KiB,
and events such as EVENT_EXT_SCAN_REPORT are parsed directly from
adapter->event_skb->data. Rejecting skb->len < 4 and clamping the
memcpy() into event_body[] to MAX_EVENT_SIZE would protect event_body[]
without discarding > 2048-byte skbs.

However, clamping instead of dropping exposes a separate bug in
EVENT_RXBA_SYNC (which v4 happens to mask on SDIO). Both sta_event.c
and uap_event.c pass adapter->event_body paired with the untruncated
adapter->event_skb->len - sizeof(eventcause) as the u16 length to
mwifiex_11n_rxba_sync_event():

- When event_skb->len > 2052 (possible on SDIO, up to 4092 bytes),
  the TLV walk reads past event_body[2047] into the following
  mwifiex_adapter fields.
- On PCIe (untouched by v4), mwifiex_pcie_process_event_ready() has no
  lower bound on evt_len: for evt_len 0..7 event_skb->len ends up at
  0..3, and the u16 length argument wraps to 0xFFFC..0xFFFF.

nxpwifi (SDIO only) has the same RXBA_SYNC callers, and its SDIO copy
already clamps to MAX_EVENT_SIZE, so only the length argument is
unbounded there.

Checking event_skb->len >= sizeof(eventcause) and parsing RXBA_SYNC
from event_skb->data + sizeof(eventcause) (as the TDLS parser does)
would fix both the over-read and the u16 wrap across all transports,
without waiting for the PCIe buffer-return rework discussed in October.

Are you planning a v5, and would it make sense for me to send separate
fixes for EVENT_RXBA_SYNC in mwifiex and nxpwifi?

Thanks,
Zhao
