Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794037685;
	b=uImRdDn81r0PnigtgOK9fNCDVsZrwtfTUrV/dUTpU1LZCpRdGjvbXmKNNU20WbvQjeVF
	 hnLqE5di49taCoRUbuNudyRK//l04YcT9Qe9rPj+Ulst2iRYaXBUlmnhavAtABy8xRld5
	 9qMCjVY3sD+VuSk4C5JtwIy1olholZDbJyrsrJU1Egl0zbXgATUJxb/SXdFVh00jXfBA0
	 jBW+Te090NrTrWNs+dEvVifsrMkn+RT67lHjua3VGN/0aH9aFaBsLXbV5htxh2zbcLnQI
	 uORESudwEOQWBzLqEmDN9ZDlY17lGLyuQAzRM0lkAM3SSOzBv9XcOohQWLLy3YZ3tvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794037685;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=sKTmFFXNQ+0LuKxmhteYbkjayGlPyuRiGRn/hzT0Zyg=;
	b=R8LdOiOWFnfWcqywY1DKiEL7SU6yvdNP18LWHOkShdkrdcBgTmGot+aP9QBM3Z77L6lA
	 Y4LjJPc7V2RG8Wz5UYhsaq6IUy+agFXEW4PvEw4Kc5kRLETH0iSKWNJPcVceMtu9yt5tp
	 hTGMZW2uLDC82E99j2JHh0twqS+c8Uah6MCqivovhhcGRJgzpPTeaHbOgLLQidcTJ94J+
	 WcYKbgBPP3XVNLdxWcdG5tR/rT2VLOTfsNrNzCx6zqVmL6GP6hp/fhjnBrn6YATEuJAo0
	 64GKZnKgz95JnhrTZwBB17WOnVxKVxuYMCFF9zKt/5fxykyy2+7Bi6sWlp7Um8H9lEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HZLZ+c8i;
	arc=none smtp.remote-ip=91.218.175.124
Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184D9606A32C
	for <linux-wireless@vger.kernel.org>; Sat,  7 Nov 2026 07:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184D9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HZLZ+c8i
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sKTmFFXNQ+0LuKxmhteYbkjayGlPyuRiGRn/hzT0Zyg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794037682; v=1; x=1794642482;
 b=HZLZ+c8idm/Bfz8C2zNAPhjmB2HpWbz9cFgfen+T7KAaia8tYo0dPBtKlxao7QG4t52tE1bm
 kc3t7+3y0ZJnmGsH6o9c5ImNMrONOIVwgmxqQqurvGcbnFLoOivsw4HaQrqTm7be9QFvYkBTfU8
 FdmxBRRnhQJqxp1m1nn5e+v0=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id aaf03b683018986b;
	Sat, 07 Nov 2026 07:48:02 +0000
X-Mizu-Trace-ID: aaf03b683018986b
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 07:48:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Luka Gejak" <luka.gejak@linux.dev>
Message-ID: <d7e20cc5e8a0489b9b22f13a9fe8a1b423d2f8f1@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v2 2/2] wifi: rtw88: ps: Trigger firmware recovery when
 failing to leave LPS state
To: "Kalpesh Solanki" <skalpesh942@gmail.com>
Cc: pkshih@realtek.com, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Kalpesh Solanki" <skalpesh942@gmail.com>
In-Reply-To: <20261107063141.25442-1-skalpesh942@gmail.com>
References: <20261107063141.25442-1-skalpesh942@gmail.com>

Hi Kalpesh,

Thanks for the quick reply. I just have a few things to add.

[ ... ]

> Clearing RTW_FLAG_RESTARTING (and resetting the hang counter) in
> rtw_ops_stop() sounds like the right way to handle it.

That is fine for the flag, but I think the counter should be reset in
rtw_core_start(), like rtw89 does. A normal recovery never calls
rtw_ops_stop(), so the counter would stay at the limit and the next
single timeout would recover again.

> I can prepare a 2-patch follow-up series:
> 1. wifi: rtw88: ps: trigger recovery only after consecutive LPS leave f=
ailures
> 2. wifi: rtw88: clear RTW_FLAG_RESTARTING in rtw_ops_stop()

The RESTARTING gap predates your patch, since 5c831644e1f4 ("rtw88:
handle and recover when firmware crash"), so that one could go on its
own with a Fixes: tag.

For the counter, maybe it is cleaner to revert 2/2 (or rebase and drop
it since it is currently the HEAD commit of rtw-next) and send a new
patch, since it replaces that line anyway and keeps the current
behavior out of the next pull. 1/2 is fine as it is. Ping-Ke, would
that work for you, or do you prefer a follow up?

Also Kalpesh, your replies don't carry In-Reply-To or References, so
lore shows them as separate threads. In case you are using git send-email
git send-email --in-reply-to=3D<Message-ID>
should fix that.

Best regards,
Luka Gejak
