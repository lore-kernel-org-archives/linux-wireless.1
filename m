Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865645;
	b=aUQiXtznHaf44iHCf0Tq9if9xJ3Rc4ZgNCtQ2kylK4RlohUrsuGDKFqD/TGe3m6IzbIX
	 X5RJdhii/PUXBjQp3N7/QjEExJtXKGcalubJV7EiqSXmuosDnK6QnIYxR5/mSCcu9TL+h
	 u5NU9U4SWVWoJsKuhkM7ERbo5FLleEQKyiYMb3Wp5F8J4YCpUtL4bdAP+ik3jJR9TA5Q/
	 8X0d6OvJF8h70DXEDzcHDxQ50tlhB6ZPhSKxuwFEgEoN6eX91Iak8DTWDejXIDRX5kbNU
	 vBktYRyuwsiLvUeAjMfl1MqtKh4MzkdDYaOUmsZPIFvjtfiuio3ZhrxCMzop8p6/yrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865645;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xRUD1m3jiy/hrv2ML7hzljeeq/snUMZEtvat+njNg3Q=;
	b=lZ0G3gMJCQviXwmk0WLLbD/YDv+AGL1r+DJ+4hBnZsRx1EcucCe6+YPqM3mnEIdzZQEu
	 OE9PVrbxcCFvFP/hKf+d+fArc9vykS3cD0lu/6/f/6Phw57crXyBI0/iCkHS0Hy+7gwBb
	 n7RJg0+aU85mTTXO51dSUoDXO07PxSYw+BDQVzcm1Hc8eUxiwJnpgXQpyjkrRUBmxIjBL
	 ezND+DV90uLJdzVs3YyoIifdYrP6xWTVrDjrq36QfWPm/dsxhaAQdvO6Lr31QXzdAfiEI
	 DeyZWf6GJxPxAvflZBAsO3Y1HMl0pKo2bI2anKM2yt4GP1DOHxC9xM6lynh3Ndwe+NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="sfBSw6/b";
	arc=none smtp.remote-ip=95.215.58.219
Received: from mta1.migadu.com (out-219.mta1.migadu.com [95.215.58.219])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C9E606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47C9E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sfBSw6/b
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nUW0iBV2ECp8Knrlsr623UaAJvJftGJk+k9uQjhfGqk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794865642; v=1; x=1795470442;
 b=sfBSw6/bSHN/JSw4jOBe8oNgt8XcrtLUFpryy24FX7sJ2bCXaeOCGvv5rCpo5X6GqbmRy6Ce
 Z1j08+l/6zZcSXoy38y12OBYAlcFOk0aq00ZWg9cflYDUrqKBDQud6lFrQjFwErPxulhkB1j5ky
 EcogVyY0AQcLksXNYVHeZQTw=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3f9456e79de43322;
	Mon, 16 Nov 2026 21:47:22 +0000
X-Mizu-Trace-ID: 3f9456e79de43322
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 22:46:14 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Leonard Lausen <leonard@lausen.nl>, Ping-Ke Shih <pkshih@realtek.com>
CC: leonard@lausen.nl, =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>,
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-wireless@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_0/2=5D_wifi=3A_rtw88?=
 =?US-ASCII?Q?=3A_reduce_RTL8822CS_SDIO_request_overhead?=
In-Reply-To: <20261116205739.462458-2-leonard@lausen.nl>
References: <20261116205739.462458-2-leonard@lausen.nl>
Message-ID: <0867C5E9-DDCC-448A-A22A-9AEEFE009358@linux.dev>
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

Hi Leonard,

On November 16, 2026 9:57:36 PM GMT+01:00, Leonard Lausen
<leonard@lausen.nl> wrote:
>Reduce RTL8822CS SDIO request overhead by filtering hardware-handled
>control frames and combining adjacent TX-capacity reads.
>
>Changes in v3:
>- Include monitor-filter correction in patch 1 as suggested by Luka Gejak.
>- Cache the current FIF_CONTROL request even when changed_flags omits it.
>- Use a shared filter writer in every chip initializer and both
>  beamforming paths, preserving the monitor override and normal default.
>- Keep the TX-capacity read optimization unchanged from v2.
>

Thanks for v3. It looks good to me, so for the series,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
