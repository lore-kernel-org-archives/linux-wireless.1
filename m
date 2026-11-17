Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894214;
	b=n1hl8ow8K80CfxGn9mRbRh7Wrd3ugKX451VbdEBUFrBuE0v+PhP+fBSNTnZvYhrTK5IJ
	 Id5e9apKVoQuCczXEHVb46wWg4WRz89iyrz04Jb6ByfGy69cn1vU0jMR5xOdGQGhnwsgI
	 Wl0yPJn9KFNEU0fY43k8VStOMblTQdXkarw0W7V1OdkoPPjardZKJ1B0e59JHB/sP3Ptk
	 s6c+7+266BXRTAYFlkW77qkqht+zgFnj8wfIyRFvHvbVi6C+MFopcp3vLmCJD0X/qE3AV
	 BwHxBMeuvrEi4jiH+SKtjPGCNVGzFnf/UCYvchnIPVxMSPy69R5JeJ0w1rFrIIKUNEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894214;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=J1ckooAvPzmLz1hOJ24+e/tiOCRqBj9lPNTgu5UiYZA=;
	b=XdKlSHqNs6e2xiHNG/VxGlJ6DKf4Q8sov9LquQmuLwcsf74nbiLirBbP0WMS3rsItM17
	 jd1QuQiHw2G3LFWg5qzYseHXOfw9sVSvBSbUkZlyPcY9TTkDTQZt29P0NO64lRMnlVO+n
	 ApExjCfAIALJV68h/RVo4I8oHRTqAOv7THebxBT7JhwXIXDXq8PSXW6bsqFHWyiQFGD3m
	 7f3sx2nal0E+xp+xuc6wPKDgW/P2MU6ip071Hh5xV6BayA/s+zpJYuKJeL/btyTjUY30k
	 9kwWi7Iw9Ywvluy2M7J91XGvmhYyudsdjQeMJOE4C8aU8GC2FVXiFVBnUXG+/8bgYbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="EBJ0P/pD";
	arc=none smtp.remote-ip=95.215.58.155
Received: from mta1.migadu.com (out-155.mta1.migadu.com [95.215.58.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A8A606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 05:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EBJ0P/pD
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J1ckooAvPzmLz1hOJ24+e/tiOCRqBj9lPNTgu5UiYZA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794894211; v=1; x=1795499011;
 b=EBJ0P/pDrZ9PomDy5YfRY+xxEydObG8hL7ep+LSEqnWojG5RaSqjhliVUU4fWuJ+lr37d5gT
 jRz5yAtFopC+AXuYWeUjvjAqa8xySkOJQxsthIrIuoZjm4SNEdTio09+mPrxnvK4TftKFmoLoN/
 lYcggvbLzvVzCeF+hW5oD4Dk=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2801067375647091;
	Tue, 17 Nov 2026 05:43:31 +0000
X-Mizu-Trace-ID: 2801067375647091
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 06:43:29 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Leonard Lausen <leonard@lausen.nl>, Ping-Ke Shih <pkshih@realtek.com>
CC: leonard@lausen.nl, =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>,
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-wireless@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_1/2=5D_wifi=3A_rtw88=3A_8822c=3A?=
 =?US-ASCII?Q?_filter_hardware-handled_control_frames_on_SDIO?=
In-Reply-To: <20261116205739.462458-4-leonard@lausen.nl>
References: <20261116205739.462458-2-leonard@lausen.nl> <20261116205739.462458-4-leonard@lausen.nl>
Message-ID: <8667155C-5EFC-47A7-887C-A2AC8F180F33@linux.dev>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 16, 2026 9:57:38 PM GMT+01:00, Leonard Lausen
<leonard@lausen.nl> wrote:
>RTL8822C forwards every control-frame subtype to the host by default.
>ACK, Block Ack, RTS and CTS frames are handled by hardware, but forwarding
>them also adds small SDIO transfers to the data path.
>
>Clear these four subtypes from the normal SDIO RX filter, retaining BAR,
>PS-Poll and the remaining subtypes. Cache the current FIF_CONTROL request
>separately from that default, using the full requested flags even when
>changed_flags does not contain FIF_CONTROL.
>
>Use a shared writer in filter configuration, every chip initializer and
>both beamforming paths. This keeps the monitor override across IPS wake,
>MAC reinitialization and beamforming, while removing the request restores
>the current normal filter.
>
>Limit the reduced default to SDIO, where profiling identified this
>overhead. PCIe and USB receive paths have not been tested with it.
>FriendlyElec's RTL8822CS driver also filters control frames at startup;
>this change retains additional subtypes for mac80211.
>
>Link: https://github.com/friendlyarm/rtl8822cs/blob/c8b944a34bba2116fcdb060362bde40242bb87e5/hal/rtl8822c/rtl8822c_halinit.c
>Suggested-by: Luka Gejak <luka.gejak@linux.dev>
>Signed-off-by: Leonard Lausen <leonard@lausen.nl>
>---

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
