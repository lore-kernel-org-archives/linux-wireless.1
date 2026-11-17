Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900118;
	b=PR2blgGwFNSb9cLfbu7UguNZ5PDnnb9n1h9YEfURaJDw6Qcd6xMovh4XJlwaylCtr/pL
	 NOLNEQ2Dokzauu+SRlA/IOav+CkHKSRzmW/BXQ7TOYBgIPAQlVSOlBrMLP1VKR3zVHRNu
	 VemYjPwwaUTmW5xZVKDjlkW7UN2IKcwJKB786qgYV3GZ9p/JAxkSHfluPzOHBfIYAYMvt
	 qzj1i7QQIlu4Fjn5L+jV8cb4tzJm0xivG5JALpHPcnD5ZR9mN7FC8P0PYPiEDlUroIZnD
	 wXwbZrY1R01LekG+eHf7BShhmc9CvibNReW4VJWmJWhuEUHqoqMJyIjU+R+uCsus2fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900118;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oxM0dfNHWhh0JA5nDAwcg0YM5ZxKXWKNv+wLwQN0H2o=;
	b=Gs6C4RO6nge9ondgGIvL9f+En8tAzcCtKWoq222tPKffWDDPj6/DAV/HVJKOkphlSXHk
	 rVNxQauudF3v4xhzIBmfFAiXmQO5z7G9LEolrZUb9wIQtyx2Z9eXy06UiDK+hb9HuZCJw
	 qb7IyDPqMtYCdU9q40GMKhJcyT7huEMmv+ciVxkD62x+JCu0jP+8iYUYzABrcVSLWJTqB
	 K5IGHUwz9ktEy7kv/fxEHFVlEOMxuk6NXkqbQkQTzem4ZVfkhm9qTO8tFFnXZNeIZmyYo
	 A6GWdVZ8gFHu8Ai2gzG4erScxY3aDtt3dcxapD57Owhxs26/hnctNGrkqsXwJNKJ54A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YHZppQaL;
	arc=none smtp.remote-ip=91.218.175.12
Received: from mta0.migadu.com (out-12.mta0.migadu.com [91.218.175.12])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B77606A31C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 07:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B77606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YHZppQaL
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=C5pBUkm+CKl8mzMt2Ynj+HJYaQvwfObB423yYROWZWM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794900116; v=1; x=1795504916;
 b=YHZppQaL+C5s0HBFTcD3hg4U5jW3M7Xi5UG9rjn5mU2aq4LFxuJ5I3mZ5YTLTvNCSY+qC9Zo
 s03iHD/k4nbwNWG48noZzJLq1fBFyvLZRVcRJeuIojU27BehYhoxHCmAQ/5j7gtldqe+42C86Bl
 yb02MZ5J5An4GcPDxpsLrpC0=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a40618706497855e;
	Tue, 17 Nov 2026 07:21:56 +0000
X-Mizu-Trace-ID: a40618706497855e
X-Migadu-Flow: FLOW_OUT
Date: Tue, 17 Nov 2026 08:21:50 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: =?ISO-8859-1?Q?David_H=E4rdeman?= <david@hardeman.nu>,
 Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
CC: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 Alastair D'Silva <alastair@d-silva.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_3/5=5D_wifi=3A_rtw88=3A_sdio=3A?=
 =?US-ASCII?Q?_limit_the_TX_queue_length_of_the_88xx_chips?=
In-Reply-To: <20261116190145.2736364-4-david@hardeman.nu>
References: <20261116190145.2736364-1-david@hardeman.nu> <20261116190145.2736364-4-david@hardeman.nu>
Message-ID: <B58755EF-D7EC-47C5-8DED-EB19A880CE26@linux.dev>
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

On November 16, 2026 8:01:43 PM GMT+01:00, "David Härdeman"
<david@hardeman.nu> wrote:

> +             if (ret == -EBUSY && !rtw_chip_wcpu_8051(rtwdev))
> +                     resched = true;

I think -ENOMEM needs a retry here too. mmc_io_rw_extended() allocates a
scatterlist when a transfer needs more than one segment. For example,
dw_mmc with IDMAC sets max_seg_size to 4096, so an aggregate larger than
that can fail this allocation and return -ENOMEM.

The aggregate is put back in the queue on error. If the retry loop keeps
failing while the queue is stopped, no further attempt is scheduled.
Fresh TX callbacks can kick the worker again, including for the same AC,
but if no more arrive, recovering memory alone leaves the queued frames
stalled. The single frame fallback can also return -ENOMEM from
__skb_pad().

Could this handle -ENOMEM as the RTL8723BS retry helper already does?

[ ... ]

> +     if (resched)
> +             queue_delayed_work(rtwsdio->txwq, &work_data->work,
> +                                RTW_SDIO_TX_RETRY_DELAY);

So if I read it right, this also needs the work to be cancelled when the
SDIO interface stops. The power off path is:

        rtw_power_off()
                rtw_hci_stop()
                        rtw_sdio_stop()
                rtw_mac_power_off()

rtw_sdio_stop() only disables interrupts and invalidates the credits.
The cancellation is in rtw_sdio_deinit_tx(), which closing the interface
does not call. The flush callback does not drain the SDIO software queues
either, since the SDIO operations have no flush_queues callback.

A pending retry can therefore run after power off and keep rearming
while credits are unavailable. The RTL8723BS retry helper seems to have
the same lifetime gap already, so maybe the shared stop path is the right
place to fix this before extending the retries to the other chips?

Best regards,
Luka Gejak
