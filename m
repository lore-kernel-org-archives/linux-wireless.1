Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880665;
	b=TyE12tzZFkGke0t4YMIODECMdrwL0+CKK1TXKLWijLzfor5VumfjKGBsFhaqz7vhLpi+
	 jizVrao8PFvqxSgx2MLuRYKcZHuSFyJ3dNoXXeTUXLmcsK7E629kGdOPA2OOncyG7BtKf
	 vg9bOYD2BAXl9ZTpgjALzDee7XfCj8Y97oEH9v7rWPgYuEGFlIq57iE+/h0nsDBd5sX+R
	 cIvcoaTn0PTsB359DyLnoWeqEWzA+iTROMy6tARClJvirfxlsxC6N4DgixwHXYr6QX4iI
	 bUyU0V9M9ZRlPT2ydywqKCTmRwKE6TMreTFPBkNg3PSCIbEdxHJEzpn0WYgtS2fGGeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880665;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=luJWdXte+J8Jp9Qy5qRz3a3WAN4flZcgU9rG+m2XjCc=;
	b=WG4jfENFhIim/XjBrgKuIOGHrU2v3ndrb91tJVR1YvVZNtfWEedgEn4g2pRslwWm0jeF
	 EKdW1MAarrl0KMD3MxPz0D2UvOYv8rjEemSKktImBEsYShfQs/hxqI1rghyG/JC6hGqj/
	 1lheGJhejtpBlXAUYuwHKQUJf1OKKE9lh0K/etE6YwhAN5CtcTuBWsfGETbztrKOuEOho
	 Sq7EF+MF6oOJ7+Cl15WGp+yMEa4NeFvSBOkpJcto4b7mq2BCun77KYArBe3glxdhUDc/I
	 8TgyMDKypIWZ21QOOTa9BjPiPmJE0XtQOU+m4ohKm/aCDYmDFwmaL8H/y0bJ+CwuSOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OZw7k+sI;
	arc=none smtp.remote-ip=95.215.58.159
Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFAF606A31F
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 15:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FFAF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OZw7k+sI
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=luJWdXte+J8Jp9Qy5qRz3a3WAN4flZcgU9rG+m2XjCc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795880662; v=1; x=1796485462;
 b=OZw7k+sIR7HhY0NMdFzpEr9HxjLh3C7D6hYpjTvlVCj1oozRzjKoo5G7MXwyP/6uEyxYolQs
 +jdaHvgRHwj6U55PI1HUaKmgy5Bfgsz+OVYNZIbNobjE9iYwqBeDsXbvsCF8EH+U9QwX07tgqNo
 j7gVR4WKAPsfcSUtGbwlhn10=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4293bfceb806a9b6;
	Sat, 28 Nov 2026 15:44:22 +0000
X-Mizu-Trace-ID: 4293bfceb806a9b6
X-Migadu-Flow: FLOW_OUT
Date: Sat, 28 Nov 2026 16:44:17 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v5_5/7=5D_wifi=3A_rtw88=3A_prep?=
 =?US-ASCII?Q?are_frequency-offset_correction_for_more_chips?=
In-Reply-To: <20261127180034.1058591-6-hjf3108@gmail.com>
References: <20261127180034.1058591-1-hjf3108@gmail.com> <20261127180034.1058591-6-hjf3108@gmail.com>
Message-ID: <1C19D24A-15ED-4AD1-B765-095F5577F161@linux.dev>
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

On November 27, 2026 7:00:25 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:
>Promote chip specific functions from RTL8822C into the common
>core for cfo tracking. These become helpers which can be used
>by the other drivers.
>
>Crystal register writes stay in the chip code, while common
>tracking logic is promoted. This ensures that the chip specific
>portion stays within the per chip files.
>
>Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
