Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480542;
	b=1U5sGdApjVAFwaL9x6dOWSMQFlTTL8XdgEBIqHPlDuM1XHQeP1tjkpIXdN2Fe0I0mMfn
	 ACCMz5xVDuEx2WjHgya+6oBvKttd9Giytyvo/Qa/5+jsm1yO9u9Q2ksgskolXPej0KPu8
	 0zSY+YvO2QEj8xJSCeEiLTd0Z/Ngispv2nhmUorQaQt4nFZBJ9VEdFHGYIOx5yY8bxEs/
	 amnrdUkYaYa/oRWGk1If83WiG5+QV5IEKHjSy1JitkcUUrSTV2dI4UCyEjpXUT/7gA+t8
	 Wwm7cGeQ+rZ6dg40qBbRFWtX02n4yg02driZXfEE4dzJc1mDu4UEWFk3SHpIYpKYw+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=r+sRDZEHrgCdILFBOlwZpD0Uy4pTk4kro1/MkEYhJDI=;
	b=EeyrwqqHZKJa3xaW9SoIgMkT7uIPaV4ViQWUd+5hKXoIxtDnBOlgvck5bs8I8fedP7zO
	 XxadDAjB7Vq1vctHlEjDBmVarRJ67INRNEOF3k4HlQaLY9+Sj0B8I9pwZ3mfiKJKNc9Ik
	 qty8GvLkH7EguqLsBuMv4hihBE73d1xYiVcJCBMWMMcQcEC3DTmfpIJEA07fAJ8EU/bbB
	 Pz+RrViQ8dlZwVbtYnK6FzYXoHS8Tx1dq8m1gC4+VemveZPakDOVdb5T40jMoonYiYVTm
	 0aHLypyR74i0bbZ5N1ioqCZvMsBU6osqX8diGQyRHdblK3UzO0IhHHlapEOOtU9cdrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=U89QZLLb;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B99606A32D
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 00:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B99606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=U89QZLLb
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f07a960666so19829035ad.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 16:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795480541; x=1796085341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r+sRDZEHrgCdILFBOlwZpD0Uy4pTk4kro1/MkEYhJDI=;
        b=U89QZLLbOz59aD8Y5kR/XtX6j38G64zNPVUntrHhIUGN0iHKJN2mNev+3NSQqxsp/Y
         +zUNVxrmOYZhlvM+nck4tWMaOuqSxIHMFEOBgGfkiUGqVoaw36zfbAIS0G9/zL7tBQwK
         gg0A7xIINvpe6nGUVtF/FxRZNhm6iAL4DF0sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795480541; x=1796085341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r+sRDZEHrgCdILFBOlwZpD0Uy4pTk4kro1/MkEYhJDI=;
        b=CaXS0ahaYAzOs5oILMHeBzBtk9qmxXdSoATJlqT+JUPSvE4xzgMj7xgkPoGZ2GAgzq
         drFS2nDi4L2KkDHftmqtXePQnysKxjL6wus1hsyMItbjlCp4h34vhoQqvtzsYTPrmnmp
         kiaQrL3Nr2mu4G6Yk5dZa0+SC/3V8y0wpjrfyolom5XglrhJ9edKcaMi3s8ldDbgu5JP
         i9OrYXFFX40O5VVNw+hcV+B5M8YfO0AIlS52hN1/KMln/eHBKv4FIctm2izXjMQuj4FW
         K/nNlpQYsqcFGQIUub3tA1w8LX1AnIbqyUGb9UEzDWHdwjvjD9Qs7TEGEuPimO7G8Vvg
         +92Q==
X-Forwarded-Encrypted: i=1; AL+hErHxKx9cT+JO/VGWlFXkMQaVmZ/hJl8NoRmFA0euBO21cCQYprMISAbd43LsS29QtUukeLW2pjH87iw7oID9SA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+o0qenC2cTEOhN32AHhP5w5Oh1Q5BGLWkjbjQjDwzmWYMB9z5j
	/tktxfySyAo2dFXmpwT35Vsi2UbNEZILf85Md4LfiuNQeAh17SDYRU5stYoPWrG+MPQ=
X-Gm-Gg: AZFdTZcJeO/jqD4hIiW/qSBYC/3kJu1en22uD/yEOagikFDjhuG7tHpUar4Jvyu50aA
	FAAOt7ykelEehIPK159uiHi2odOZNJy77kSllPe7bzfccowC7I0T+m3NgVTU5+3y+J0Bk3FJ2EN
	TP3eI14ze490Uczb+dpXGFBekNKWykhV2mLjzIJefDc2ZLH2k8Cx1Sc3VVw7M4ve+mqz6dxvBem
	GiN5D+6dlXZD2Uu43rsePMzu7CWJQ+IAGno0XyaT7H1xh1E6E0ACzYZdj7Zl7vbVWbo3Gyr5o8a
	m2QuncbateGpNsiwpVvN7vO5aydJeBd1hIJsK+vZ3YikoFGB7o+yIudVySYac7QmqDeSL74N4m8
	MkxPwIVDfpS14ldyCQ2aJxJ9fOw84cTleXk0tcPhp90snWQAtRKDLVgNCsdBdX4LVaOV+m6Gw98
	M36bHFHdULmNZMa5L8jCmuMrXsDpqQYY5wLJCzL58y64g3/A4k/p7eOMlFJZk+k7tF6985zvZxc
	7kCXmlzabg4QYKUfaqmTs83gTUBr1V1KVBPaPIILFxYohbbNETCaLFSPBzR/dqjujjx27mwA73z
	bTI5hWnXsFMXFZMAPxJUWao6hRRnaXYfNvhjqqSyhkESmbE07UX1ZpvOEvjKf+yfAl74/BFMkvw
	6OEi7E9KrObNyaDvnKQWtJ45/hqokRvsBou+Y7Wo+v96EEuvYxR8LZaJVdvRLfDEB
X-Received: by 2002:a17:90b:4483:b0:3b4:1877:8d30 with SMTP id 98e67ed59e1d1-3b41cb4fd23mr11751289a91.62.1795480541093;
        Mon, 23 Nov 2026 16:35:41 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm6076667a12.8.2026.11.23.16.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:35:40 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH wireless 2/2] wifi: mac80211: widen the mesh IE offsets a u8 cannot hold
Date: Tue, 24 Nov 2026 06:05:26 +0530
Message-Id: <20261124003526.78471-3-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124003526.78471-1-piyus@iiitd.ac.in>
References: <20261124003526.78471-1-piyus@iiitd.ac.in>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extra IE blob a mesh join carries is bounded by IEEE80211_MAX_DATA_LEN,
2304 bytes, and ifmsh->ie_len is a size_t.  Two places that walk it use u8
for values derived from that length.

mesh_add_vendor_ies():

	u8 offset, len;
	...
	offset = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);

	if (offset < ifmsh->ie_len) {
		len = ifmsh->ie_len - offset;

ieee80211_ie_split_vendor() returns a size_t.  A blob whose vendor IEs
begin past byte 255 truncates the offset to a smaller value, so the copy
starts in the middle of an earlier element and emits bytes that are not
vendor IEs at all; len truncates with it.

mesh_add_rsn_ie():

	u8 len = 0;
	...
	len = data[1] + 2;

An element's length byte reaches 255, so this is 257 for the largest RSN IE
and truncates to 1 - the IE is then emitted as a two-byte stub, and a
secure mesh advertises a malformed RSN element.

Neither is a memory-safety problem: the preceding patch makes the two
builders cover disjoint ranges, so the beacon's single ifmsh->ie_len budget
holds whatever these values are.  Use types that can hold them.

How this was found: alongside the out-of-bounds write fixed in the
preceding patch, by AI-driven fuzzing built on top of syzkaller, then
checked by hand against the code.

Fixes: 2b5e19677592 ("mac80211: cache mesh beacon")
Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/mac80211/mesh.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
index eb54bd98f282..4ab776e174d9 100644
--- a/net/mac80211/mesh.c
+++ b/net/mac80211/mesh.c
@@ -354,7 +354,7 @@ int mesh_add_vendor_ies(struct ieee80211_sub_if_data *sdata,
 			struct sk_buff *skb)
 {
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
-	u8 offset, len;
+	size_t offset, len;
 	const u8 *data;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
@@ -377,9 +377,9 @@ int mesh_add_vendor_ies(struct ieee80211_sub_if_data *sdata,
 int mesh_add_rsn_ie(struct ieee80211_sub_if_data *sdata, struct sk_buff *skb)
 {
 	struct ieee80211_if_mesh *ifmsh = &sdata->u.mesh;
-	u8 len = 0;
 	const u8 *data;
 	size_t prefix;
+	unsigned int len;
 
 	if (!ifmsh->ie || !ifmsh->ie_len)
 		return 0;
-- 
2.34.1

