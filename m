Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795870074;
	b=l6yQUK5XR06M+knRXRL22rsoRz2rvMMSqs0TJefYgSCrhNiSrht9gJk0mbXvDyuv6u2e
	 Vd7HtGf2Re3A/4qI6wVcSrIwjrIArnAM5rFJhkL0myceTHrrTc4aOM3aL8fN3hnCfNuYa
	 0lvol66NEolRSk2+wy0ZO4Ex6nhooAgASNvWPeVn8dQ/HAr0OoDYpR95RbZ5Thu1s5gk6
	 xxgLeCMszcfCzvjjT6tTxHQwkCqlVfYn3jkXpkYB6XmhSeIWhnz5x0h6E5fBErswiSOmn
	 NDYhmWfgAI8X7aXIaoRlm4TvzrbNokaT6Go0vWhU24YHWkl3pWDYTAES2qWO1hM+Ybw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870074;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Rp5MtDQkAsdatvZfkWSUAzwcKA3qlYc99ejqePYxZdc=;
	b=M3o7u2kvLAu0i2bopqXbEIWFg1T+uks+qXqhOzwXKiT6Aa66cvVo3HxGotKceC8uqFck
	 cnPCZSyj3tKxIvVMugMn+ASh2eXtGUtmPU3EMZ7uyZBM51dC1UPFJnsQ+9CbnI5CAWw3i
	 JVknYu8MPrgohRplfkLl3gbCm/vNGiF47u6XaQhQz/atHUpwt0ErXT1eBrWm7Qjxc/B5f
	 EqHNBUPrScOE4w60MVrZPxpC+v6a78aKxijlnTtQzW8pl1zYMeISG0ssKTlX/o/rGDLwU
	 y14xvzffdcorPZVOMFNMYRtgJBKV1OkVm7PUyzVvNmEaDQ6TzM0Jcl2ZIW/wblJDTlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h7oNLxko;
	arc=none smtp.remote-ip=91.218.175.139
Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57360606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 12:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57360606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h7oNLxko
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Rp5MtDQkAsdatvZfkWSUAzwcKA3qlYc99ejqePYxZdc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795870071; v=1; x=1796474871;
 b=h7oNLxkoq2AB3OA42YI8b8oS5sRNtB7S6ANthANmbeGvH2+0z38Ywytrb3L3WkwPkKpDW2Bl
 iAXtLsnZcdweLgd3QeSxYQmfHn90MBxkAnAHuFgRJREmGOAr9WlkbCLT++deAIl7JrssKTJzrqs
 XpPuZeCAEZy+d9UW12pmlbEY=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8a15a7addf0248d9;
	Sat, 28 Nov 2026 12:47:51 +0000
X-Mizu-Trace-ID: 8a15a7addf0248d9
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 13:47:46 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: linux-wireless@vger.kernel.org, Maoyi Xie <maoyixie.tju@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH rtw-next] wifi: rtw88: usb: reject oversized RX packets
In-Reply-To: <20261128055454.4121906-1-maoyixie.tju@gmail.com>
References: <20261128055454.4121906-1-maoyixie.tju@gmail.com>
Message-ID: <474D19D7-8A37-4F68-B13E-302F2F5CFEA7@linux.dev>
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

On November 28, 2026 6:54:54 AM GMT+01:00, Maoyi Xie
<maoyixie.tju@gmail.com> wrote:
>rtw_usb_rx_handler() checks pkt_len + pkt_offset of each aggregated RX
>packet only against max_skb_len. If a corrupted descriptor claims more
>than the bytes left in the URB, skb_put_data() reads up to about 11 KB
>past the received data.
>
>Stop the walk when a packet does not fit in the rest of the URB.
>
>Found with a CodeQL-based static analysis tool that we are developing.
>Reproduced in a userspace harness under AddressSanitizer. Not tested on
>hardware.
>
>Fixes: e9048e2935f7 ("wifi: rtw88: usb: Copy instead of cloning the RX skb")
>Cc: stable@vger.kernel.org
>Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
