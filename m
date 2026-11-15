Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.80
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750165;
	b=lu6GLtg8jtCHsIYSJDP6HkKAy+6no1oHaH5S4q+oaEMPLlYy2ab/YSvepaOFVoWQ3BIu
	 AgDvGy4mS+jeF9TK4/tysgezwol/0stoC3FRQ2X+QMjovY9l0MgVQs01u/1HqTlEkYzFL
	 hl0W/JEF4Sf1QywPTgICyqhGjfWxINp2HHqsR6TBt1D/x2AWhus5A9YgzkDWnXOpajrYp
	 F27B7bYwZ9FhZJsG7SyfteG7UTPb94KscpHVeOvwAB5AE4AH2ptsY/kEcCszcx2yJR7eD
	 ISGi55IUk3hXoXaegd7bZ5S9nw+2DjkZKqZFblnpiEq+1Cfaagh+4VB6mU3XRI+unVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750165;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=CzrZb3Zd8o48Hpqe2mTWemktOybsKjrXRs/zD4WvXLs=;
	b=ppz1Jlws2WsWfpkiDsn0A20fy/vY75cXCHrsNrehoWmoaCgRbY22h0k1xublxzx0MwA1
	 l+DXDfHsxyHsxjCtIfLy9L9BxApHLcrZgwlokVMnIj8mGhoFM5sfMQpiHUqSLq/v9ZJUM
	 hQHRMyEPwV17BQa3gbqVPUX8ilsaapZXg+8b2I8FKRfuHBr95qUE/BtS08mGRvU0B6fQt
	 6X2kcAOfEr2H1SCD/zHKZcYAeMccEIJhNIhIo0cuD48zJ0VQiBSmAbNpidvCASH5OkZxt
	 8UstHHkAX0JMKCUx7gXvqIWH7bI6gHcAyIgZbDw102w5JS0QwHQOBFSY7UKaZfb4jHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YCYNzJCN;
	arc=none smtp.remote-ip=95.215.58.80
Received: from mta1.migadu.com (out-80.mta1.migadu.com [95.215.58.80])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BAE606A31D
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BAE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YCYNzJCN
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CzrZb3Zd8o48Hpqe2mTWemktOybsKjrXRs/zD4WvXLs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794750162; v=1; x=1795354962;
 b=YCYNzJCNlhqDNm7T8D15c6+TVxAW0LOvBB363LvetluLJR4q8PKEj9kctOJnPo9FVr1PGMOO
 Esjs6cGrosgJgixg5M6cb7XlUfLygsVqM2fOPsK5dyvqp94IEMDRX8QOz66HzHaCnc/7uq0/uMb
 ydL5Du+/242VbXM3PNfLOW5M=
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 260a9f29dcf82ef2;
	Sun, 15 Nov 2026 13:42:42 +0000
X-Mizu-Trace-ID: 260a9f29dcf82ef2
X-Migadu-Flow: FLOW_OUT
Date: Sun, 15 Nov 2026 14:42:37 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_6/7=5D_wifi=3A_rtw88=3A?=
 =?US-ASCII?Q?_88xxa=3A_correct_carrier-frequency_offset?=
In-Reply-To: <20261115114336.1739863-7-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com> <20261115114336.1739863-7-hjf3108@gmail.com>
Message-ID: <329749D3-41A6-401F-9D1E-EEDDBC3E5CD8@linux.dev>
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

Hi Jie Feng,

One more thing in addition to the other patch 6 reply.

On November 15, 2026 12:43:32 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> Use the newly promoted helpers to implement support for 88xxa

Could you expand this to describe how the CFO samples are collected and
used to adjust the crystal cap? I think the two path reporting limit on
RTL8814A and the handling of the efuse crystal value are worth explaining
too.

This adds more than the callbacks, and a short description would help
explain the changes to the shared parser and chip initialization.

Best regards,
Luka Gejak
