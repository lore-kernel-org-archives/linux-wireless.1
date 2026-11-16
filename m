Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866372;
	b=IB2/jW0SqviAQPLZCmDHduOXIa3TjwChYyyQvYQmUbYtBsvJMNgUeWO6DEpmfOo/txK1
	 oJh3iswOes9o+0ppB2Vy4N6SSHp2d14UOHy1ndzHtg2DMXvGkqiJBtzD518LwBCL7CBoz
	 cKG/azYyQhi0EV9hsrsC9fEglTNL9C8tg4VmLGyJgiN1BAyH2xrOEl1vt9mMpMfzz6Lx9
	 3OS6ZT3EmBvsEisKq6o3RQrabAjoT6Rb4lpjcTmuKgfv/pWxIcRZhzs9gFmDRY/FwLoSe
	 JZYnwfGdTTTMEW7wIL0OHceLNgoMeGMjOF+Q65nnHqCxyDWTy9zwKk6qMb7qq7eqm0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866372;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=BjDMWhv8C1QNl+YtRi+xoYimXYk6AO94Q4Z88E2ewAU=;
	b=nDB+SO5spUZ2bn0J9yNdiW2LIfT0j/b9cewi2rT+AXsAHAAIQSuExKNBPAd1LnLawaPi
	 MfhoG6I6G/iU6pz+qsmFyckDD+zKnmLQs4ZR4P9XmKEAJODqryTxUwSRmtz4Zju6O51PH
	 LifQrki88apqXOKj+rXA3rEQBCxPzsSuFhGREl1d/OpwskaRT+6wOCz6O8FU2ZE3cjmvF
	 66QM1veQ6RcB2MdIeQXyCDekiECltZ8ok27lRbqn5jYB2HS4pge5DSx8nGM69KEaiuS6a
	 H5Ta6QfG9c3zC3K4OXBG6xHOBPXQsZS9T9hsiVhAhJ6bJefyrtNnx0X8ekK85+phiEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bKHWqSRa;
	arc=none smtp.remote-ip=91.218.175.203
Received: from mta0.migadu.com (out-203.mta0.migadu.com [91.218.175.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88619606A322
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88619606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bKHWqSRa
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VoYLSpmM1RXT5ni7s2+3FmJDvPFfKkDbMhe9GOASVaY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794866369; v=1; x=1795471169;
 b=bKHWqSRa/rpJ+TugxulFqzfy8UT7rJXX/vYAQVCerElA2dUA7oGG3THD4+9b6JC/xo/JxYTA
 9R99+nKMcqy8De0KMDJSG7SZG8aoI0izJ9CU+c+wfOQRth8dqVrlBPOGHD+ODWZ+V8jwwYkIExO
 YjESxUekgw663u59BKtr0LHo=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 77b19879a44724f8;
	Mon, 16 Nov 2026 21:59:29 +0000
X-Mizu-Trace-ID: 77b19879a44724f8
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 22:59:24 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>,
 Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
CC: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 Alastair D'Silva <alastair@d-silva.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_0/5=5D_wifi=3A_rtw88=3A_sdi?=
 =?US-ASCII?Q?o=3A_faster_and_fairer_TX_for_the_88xx_chips?=
In-Reply-To: <20261116190145.2736364-1-david@hardeman.nu>
References: <20261116190145.2736364-1-david@hardeman.nu>
Message-ID: <80AFCC99-7116-428F-82DB-460D40110DC5@linux.dev>
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

Hi David,

On November 16, 2026 8:01:40 PM GMT+01:00, "David Härdeman"
<david@hardeman.nu> wrote:

[ ... ]

>
>Two series on the list touch the same code, and I'd like to make sure
>this one doesn't clash with them:
>
>- Alastair D'Silva's "wifi: rtw88: sdio: Fix unhandled RX request
>  interrupt storm" (v10) changes the RX interrupt handling that patches
>  4 and 5 touch. This series is based on rtw-next without it; I have a
>  version rebased on top of it and will send that once it's applied.
>  https://lore.kernel.org/linux-wireless/20261113082242.2773369-1-alastair@d-silva.org/
>
>- Leonard Lausen's "wifi: rtw88: reduce RTL8822CS SDIO request
>  overhead" (v2): his patch 1 (control frame filter) is independent of
>  this series and applies on top of it. His patch 2 combines the free
>  page register reads that patch 1 here replaces with cached counts,
>  so only one of the two makes sense; Leonard, I'm happy to go with
>  whatever you and Ping-Ke prefer.
>  https://lore.kernel.org/linux-wireless/20261116100804.425592-2-leonard@lausen.nl/
>

These two will probably land before your series, as both had gone through
couple(or more) versions and both carry my Reviewed-by tag.

Either way I will review it in the morning, so we will see then.

Best regards,
Luka Gejak
