Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795795720;
	b=HzNxeLR82PAl6YmdtLj2p+PUs7voMMIyajP7RS5m/w4Upsxg/9Vxpr9xoTQB4COscy2L
	 Wnb66EYVVm5ReIRK3h1phSgD6eIZb/HZ9rZ/O5rb2scMnGf++LnnKo9ibzA/N4MPYrZa2
	 AhtXvQs8r+HLiptQPZvOnfNOCruh+LZ5viEcSe8/EkW1Ss8RfZP1PgmczvIGKc7UKQlqH
	 Aj3/I+XAsVwAHpPGpUvn/maOWFzC49RLHHSPSui2ntaBEjbKflJsGkGMz8BuXEbX87SoQ
	 gPvDrL9T9/VVnmLzH1HeRtmcrwvRkAeP2fIX7x/Z1W9l530xvz4Chr+HDws+u8X+Dfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=sBmgHtiFz0VMvHABfn2o7b78SMvl2lLwiG3UTCye1R0=;
	b=PHeEY9gnfayB1ibB945YUpe9MC0I0w9X5eGvXreGt9CSp/BRYyb54JKRcsKl78EIYi/p
	 jTdvl8JSQxKS6JQg2+c0BXyHtkWLa9cY1D+yBsiPpkx/mLm6VwfHb5cAqE64Dj+V1oTI8
	 d5irbS4MkyaIVatimTjMKUab3mEoOKyC3ZAcsJGiYxUXLmDUE7+YdTjOmwUv2I3TMSwpd
	 EJnkR56OADGQBk2EE08idKBYRsBazORmabwuOH6i0JRtC/mlb+HvjZcslVrD/KLtVUOYq
	 xSphq9MUGH3wFEhwjhKP/hWkOXKaCHetqt9iCuWLLmNdNNQGltjZ8z/AJwyFquMdNuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/Te0ljH";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E8E606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 16:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/Te0ljH
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9217800e7f3so31810066d6.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 08:08:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795795719; cv=none;
        d=google.com; s=arc-20260327;
        b=OWpr3PIj1RYaSp7SNvdENDn8weqqP+DmkntIGMnCbo4ATnyNP0NpRc531MeWU+0kHu
         ogswMjWCIlPIENWXi2SePpFddEQ7naNrzDX9jyb7J09rr7dTX58UkiVLHox1yP2sGMGS
         sany77ZnrSDbCpcUnTztDE3fTBaZBhxClkzdf120AafySht/uAuPesoYBHyreMLofhDj
         uS4qN/49SAHXU80WYBMLK8QtiFdxI8pv1FPAZ5GtwHtHib+P5fuqLVCVET0wmHT0xelO
         5HaA/Or4yyMd9nWh4VoT6IAk+5FvRP8S3L95+aKkjk1uKY22fnzmjjsCNE/SO/4qecfM
         whzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=sBmgHtiFz0VMvHABfn2o7b78SMvl2lLwiG3UTCye1R0=;
        fh=g4qIvl6/31HtnerxyVK37f4FNVcorEF6JuBH5wiMpis=;
        b=GGGlAoyp2TDvCipvaUxjJzq8Uqq9XSECuQNqDUGRAXN11DD80e8rTmLHGPZkf/4RLY
         PjALIVeAGDRdnvc7CJBzHDX7HAHz8Izg7Taa+1e9jStWNax8WwLPGXytXtT/Y7pPw/hF
         CMztqF8oRSiBHflGzDJooTjudscY25KLawKLRfsUaPRU6e/Div4c3Bm9WtFoCi1l8RGK
         NPgt3/L/XRpCanqRhdq8W/yhInENJerd7tF5m86/XcJk9psZ+Yfr6kzHpSOI1ZUppeRy
         l47A4sHCJjx3taY3wZrSQkQ82AF5hc+6xLsegzLAQ8k+NRlNV6Y7qCbv+EUWk5US0tjn
         obeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795795719; x=1796400519; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBmgHtiFz0VMvHABfn2o7b78SMvl2lLwiG3UTCye1R0=;
        b=h/Te0ljHg4nONyicOsc3g0fXrV8Z4M8gjaRmibVqSBkKgqew0BydhHWYdiNMVMMSgF
         +7af6CDYXduSzJSNcqIs7lYg3diBA/RreFoZZ1pWlnsLAqiiiY7JXpoK39xreNmZ+pbq
         BSfTkeStF4HkSd6nTHkeX3gm1XkmIq/e8VBYXbbzmbLZjdACfDlw8TLoEhr5Txp/Fmq6
         /nHzg9xOYpJABns5RvDg8uXirWU8hl9rgL2P9KETWCXBKuvuYg1DyigOK6DjdBjorBEl
         Ou+RsF+JHBCs0AGaOYdzg+3/AFlVcecASCATzBrRms9tmHl4IWC+73LZ0/mX0U4H9ReI
         P/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795719; x=1796400519;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sBmgHtiFz0VMvHABfn2o7b78SMvl2lLwiG3UTCye1R0=;
        b=bztzGMd8ALyDUff5a7FPUdeQH8zxCTo7yw26ELQOjiB1aTLBBJ0u70CMeXw2mvwgH8
         wUzWu9oLP7CPAO8okdIN8vLiFIxtyobA+82POc/A1O2DAMVa2zKquqM/kPou3GKTnQJo
         lLI8ONjvIe1Ha7SYDdjBVUHSNP76hXWwSvc9dU2zz19E5Ij+7JmHEHf5/RfqS9KECbx1
         trPBheSPVjvmA0EZQBuOehDfIDGZMN2PFKB5Ajws6096U3BhT89P0OowLXJLjZ6jsx7l
         VDjC/8ZJtaBmJ//CF0QUhGMja1OC9MPG7+FyEve7gtltyI0HEhgLyfIUW92cfpZlcga5
         3aBg==
X-Gm-Message-State: APuU4Z/8NubYIbyrh7eVVR0tyis8HJ7V011V7cBlBMqQxWszH99oVJUw
	FKzfRFQzt7RGcFR8m6Fe7EbiMAJeLXZwFUdf2an/6lu+rGJjq0ZHmj0uHNSBWZdbhpfJ2JleQDk
	dU1JtbS3//tcsCVd52+imJYuv4pFrLI8OGA==
X-Gm-Gg: AZFdTZe1CTzQ5IOVZFrDfi3rK923F2w3aQAZx76GBMm9AyQ0IwEmcWbVjy5fVNbWL9c
	N8BbNBmkCvAnlMXB7Vxvm23nvF/D5eBHuWAWRTeKJ2PG5Z5oTomQfskAPqnh6U86XlQcWD7VjO5
	DPKPJNH628XgulgAPKdq2v9p2m85NbQ3Mb63baBv063vE8TpQ5+l3Tlza+sPBNEBkIcGkQXFlIb
	j2G/0zPWNmw+QSTeLp8wDSUEu5HqrIjy1PtJIjfaL/OrQRh/E5bpxPRuBkG37DknhI3qx077tsM
	X2iYcV0ERqKeEUWL66DBOhdOdfo+ruVbdeGDGYmpxVtY31fn3e0fv9DcUQ0HF1wYZ5VzBgEgGr/
	PwQJjdSHQNATgilQJKS4WncxuMo9S+se7GVF036IsGjWyryYKiDuvUJ3BtFCV1Bomm3F+pnKpEG
	xsJQUaYH6BtYHkBIIVaFB/V9pc9MEOM6v1fdO2lVB6K/2Y+crZtRegBPubHLbb9edHLPkZ8B/iw
	A==
X-Received: by 2002:a05:6214:33c2:b0:91f:c42:2072 with SMTP id
 6a1803df08f44-92134ae107emr447195866d6.21.1795795718725; Fri, 27 Nov 2026
 08:08:38 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lucca Moura <luccazoppi@gmail.com>
Date: Fri, 27 Nov 2026 17:08:02 +0100
X-Gm-Features: Aa3M54phhK4UNCaQJq6KfThoT-WGLkjEhPa5J8smXeZGNAIVwA0uQNSpdrsOKtc
Message-ID: <CAJC97KF=gFLoe_6pu07QzprMqYiCgcnRGe8yKAMQcnwVV5BD7g@mail.gmail.com>
Subject: wifi: rtw89: 8852bt: frequent SER halts (DMAC_ERR_ISR 0x40/0x2)
To: pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

On an RTL8852BE-VT, the firmware halts several times a day and SER
recovers it. I see this with firmware 0.29.122.2 and 0.29.122.3.

- RTL8852BE-VT [10ec:b520], driver rtw89_8852bte
- Firmware 0.29.122.2, and 0.29.122.3 since 2026-11-27
- Linux 7.3.4 to 7.3.6 (Arch)
- Laptop: ASUS ExpertBook P3406CCA

I logged 30 events from 2026-11-17 to 2026-11-27, recently 6-11 per
day. Each logs "SER catches error: 0x1000", 0x1001, 0x1002, and the
connection stays up. Nothing else is logged before an event.

Two signatures:
- 21 events: R_AX_DMAC_ERR_ISR=0x00000040
- 9 events: R_AX_DMAC_ERR_ISR=0x00000002,
R_AX_SEC_ERR_IMR_ISR=0x00000bba

In 2 events the driver also logged "firmware failed to ack for leaving
ps mode" and "SER catches error: 0x4000" during the recovery.

Excerpt of one 0x2 event:

FW status = 0x85001100
FW BADADDR = 0x1eeee
FW EPC/RA = 0x0
FW MISC = 0xb898785d
R_AX_HALT_C2H = 0x1000
R_AX_SER_DBG_INFO = 0x1000101
[ERR]fw PC = 0xb89880f1, 0xb8988161, 0xb89880fd, 0xb89880f5, ...
R_AX_DMAC_ERR_ISR=0x00000002
R_AX_SEC_ERR_IMR_ISR=0x00000bba
R_AX_SEC_ENG_CTRL=0x80002f0f
R_AX_LBC_WATCHDOG=0x00000081

I can send the full dumps or test patches.

Thanks,
Lucca
