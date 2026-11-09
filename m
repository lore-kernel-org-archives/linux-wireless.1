Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213776;
	b=jzaWu6d8m8TyYJn3K1/YCQIZw4zIQeU/ubQsfB24T9XMULujGEcz/Hu/K9uT6g2GWOJe
	 rCMx27hRYviKkFvP7HLskiZw6iJkpmzSHbYnEsX17lCVEj68iOwl16Kn+xs0Em2Y7fZ2b
	 HfYEiRHn58epsQ4VbnkJBXdBRx6mwliLuDSt+Q44rkzZ0kXjVrROj8bSKNtBTEUzSAM0c
	 0ldpr3C3NXZtJmeMfTNjMMCPdFcTrhe3c2QwcJ4zgyez0hyK9k9RPluPnaCr63tgM5ifa
	 dDzHm0NOHkuyjBmq1GtNYgBHt6uSu2nUgBiOsbVLnI8cpsYc+ZxPQ4tiQfYvzIZ2Feg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213776;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LtdyX8DPqa/hf4d5KaJuhHuaYLQ673pZgSExYeG5UMw=;
	b=YkyyQgQ9aRvmGWb3Hsw4ihg/6zK4YobZ7Z+0T7gV6UHqfgif63d9RQzVKaSq4UUg/hF4
	 aNj7jjl/rLuY5xTqXkhRgDadzxw0RVzDZjsSin5oOo4q6KgCcwr+xfj0anjDblMwVHG2q
	 7WNJ9czj0eaJ35LBL0IQeMk3qmSWe4Ekh3CjqmJpF40E9fAEpV8sbW2kyjV4Imykb2DTe
	 emp/LOil6ixX3+TmYCj/QT8w1vns8EkbNkM3wUr2b8dKb326TAYPhx6HSFOHoze6aXo/l
	 mqd8eQHGPJXkd1mhWRvw8ZqGEOgJATWSnTZ1crOPMphyQjVCWfmLLdkU1gvMeaWAoRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nmikw6dT;
	arc=none smtp.remote-ip=91.218.175.129
Received: from mta0.migadu.com (out-129.mta0.migadu.com [91.218.175.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8708F606A31C
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 08:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8708F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nmikw6dT
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LtdyX8DPqa/hf4d5KaJuhHuaYLQ673pZgSExYeG5UMw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213773; v=1; x=1794818573;
 b=nmikw6dTxxCg+N2++pAkytUTJcWM6yFbByxJY9nL94bxrTkKHDh3gnGOlC2zKojDHjpjGyue
 HptwaQYKMMqNC/6go7PPV0wR96nOVsSb68EMTA/hoKC6NatDbhVI1L6HUVO++cbOwsvESQudMUf
 fQwFM5ugAWdQmj+RtKy/8Sis=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b2eee2c38fa356b9;
	Mon, 09 Nov 2026 08:42:53 +0000
X-Mizu-Trace-ID: b2eee2c38fa356b9
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 09:42:49 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: KALPESH SOLANKI <skalpesh942@gmail.com>
CC: pkshih@realtek.com, kvalo@kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_3/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_ps=3A_trigger_firmware_re?=
 =?US-ASCII?Q?covery_only_after_consecutive_LPS_leave_failures_on_PCI?=
In-Reply-To: <CADYuhkpGHNq_B-2qKqjD7R4fAnaVBM2emwySyq4E4u==wLBOFg@mail.gmail.com>
References: <20261108142708.489067-1-skalpesh942@gmail.com> <20261108142708.489067-4-skalpesh942@gmail.com> <84AB3D74-F70D-452F-B621-B5487951B719@linux.dev> <CADYuhkqCNQxevZih3D+Zu-HcuyOao99iF31+Y6kDP0iM_Rr1kQ@mail.gmail.com> <CADYuhkpGHNq_B-2qKqjD7R4fAnaVBM2emwySyq4E4u==wLBOFg@mail.gmail.com>
Message-ID: <565AB9C4-8C29-4885-A830-919AEAF63CF3@linux.dev>
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

On November 9, 2026 9:32:09 AM GMT+01:00, KALPESH SOLANKI
<skalpesh942@gmail.com> wrote:
>Hi Luka, Ping-Ke,
>
>Thank you for the reviews and feedback. I have had a bereavement in
>the family yesterday and will be away for a few days.
>
>I have noted the comments and will follow up with v5 once I am back
>and after lore/patchwork is operational.
>
>Best regards,
>Kalpesh
>
>

Of course, take your time, no rush.

Best regards,
Luka Gejak
